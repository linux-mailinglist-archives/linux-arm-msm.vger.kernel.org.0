Return-Path: <linux-arm-msm+bounces-90534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OIVNjpNd2ngdwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:17:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB11878F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5381330067B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA61F222575;
	Mon, 26 Jan 2026 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfeydvKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aacWYECb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833AB2F49F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769426188; cv=none; b=kOoJLU0jxCqWjxyb4KiTOGygyjr0/VoOylIqm9ura3zU01CJpMNpjzGEAiKR+bXrCHv2JvGPJsI5L1ERDNfm6A/ql/56BohPjQ8wRqHJ9cVc36NigfWL8GdBlJPgHeQU4mun+OZwmKepgcvAc4a1HqyK3BMFQttOQeCvjXkBF60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769426188; c=relaxed/simple;
	bh=hEBzM4Fc9u8MMgKXl+vj3ggndmfkY+7T+OgVyQFAyuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLCM3hamXRsyqExE/R+INRHYkCMABOuT2O9CPpC0rPgelNimeW0VeB6QxAc8aVCdg+A4InG5ao6iMLASmSArbCdo4tF+gbh4t7FbZ8953jCJRySLX5k7Ix58DlJTV7k9UwlqEGON3y+s6cFGMk2Tu7XrxTqZu0IzRBEUptd2ZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfeydvKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aacWYECb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8hOmJ840486
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 11:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=g/gzVTzM6FtddJt39uZzR7RvFSBpRjHIRrNIymG0OGs=; b=Jf
	eydvKYmw8exrInEKodbyJ32JEK3dsAYCp+m0qO7HrPdms9E6hrgHY9nLKvs1GdhB
	8spbJR0gNM9bMCyyojKqBSyyiuyuH774n66SQ17EW1d+2UvOl9Y0HoBOCwJWp2Zu
	8JUP76n9CXnRhhdrdLX1e0d5UEGhp5hOb9GFA6p8HlgE5d8iqLJrvXwWK9RlHCfI
	jfTADBcmTVjV6yGB/nNRHfqN/Ij7LZzYHBJFTDOJZTStfOF1Z5Fo4LLJOhX5CDhz
	6Bc4DwG+tskXSAioJaTIMrr6ypa3hu7cqrQWUhwgHthArmUDgBh8IFVHlwPjk+c/
	3+iFcfePLFlEMTMdNRJQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f4a78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 11:16:26 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9483e4a8662so3754711241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 03:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769426185; x=1770030985; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/gzVTzM6FtddJt39uZzR7RvFSBpRjHIRrNIymG0OGs=;
        b=aacWYECbZxhvptUd6oXZ8P0rrSOXxdOdsAvM3na9F4HjNPaBkqzAUyByKDTmMrI4pW
         2I69ruka0f9m7XhaSvTfjEZcohs833978RvhrRHT/0Wiwj3CVqbccQJW8SE8k0UBbkIn
         b833wNQ9NKmKqVRaarYer8kJK4rVdezWTEXwjHNY+dxGRY47AlbNnrfQMiy/GFLNYpaQ
         /PEUBomKPvAQNRH9MQgu+zPe6W3GN2t+vREiJisdSI+JsR4e5Qz+x1Bdiwuh3NGqbrb9
         dIO2Ad9AKpWIHvLa3uqR291e5M1SvRgoq9MPOdmEhj9T9o55SIDfFoBPdNaGdQQTLBej
         KVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426185; x=1770030985;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/gzVTzM6FtddJt39uZzR7RvFSBpRjHIRrNIymG0OGs=;
        b=gmcOTHKZU8o0mVCdN+r73YbH8o2vg4awzl+qafIbOqjIq7e668atMWvs6KsmUYNXtA
         8jwwBeqtUHxEizSYHAPdR/lm4FpSFXLyezAk3TWTKsT09ksWJvN1EyL3b1o5RO674xKg
         hZL0dBY/4I0NkAg0asX1OVaHOpGHRHLMa1jLegiHBppkwH0fN/GN9b1EZFCGV8WFz7Nk
         8pkgHXXQ+FDzr88JoFv0nGX9IvmatHOxOaSREJwiw6TP8MHpLFIZyTQdpk93e9CdgULj
         T65UCUFzIWl058LhJwQtbg/wYEoTUzzUq3nCdHn7HOCc//CXN46X0zAfzkdkZTN8FJmj
         tAvA==
X-Forwarded-Encrypted: i=1; AJvYcCUGFBHtAW6cIaqq60jLRAjg89SraecI8KWrlqTt0m4z0FlqX1Bjb6W2yDQ7m3ChHsfQWvG43Zdo5UuV2EPi@vger.kernel.org
X-Gm-Message-State: AOJu0YyY4Sqjldyyv/b/jTFYU+FRq1dS5h1zmF/7J+nMkDzSXh3VCsA8
	0n125ZUhJlBuOV8Iio5wSzluzn2WgcmFRv7bVYU0EtX42U0Vdh0tsD7Ru6H+CqPfupbbz2BOFXG
	GKS2J298Ro56WfBFircOT+dEXDzvlRzYzxTJg47/VaAds/sekxeHpNb/aNNbtnOEHRC0a
X-Gm-Gg: AZuq6aKNlRKzrYtI0jvh4JqqcmJddwxHGq0haJmKA/eGOECVGXE4rwDkvXZ742LAdju
	qCGdBoJs7A1AHog+a7Qo6kr8W3zy/quQ/PbHalcjM4LU5sz3pXxxNhN1X5oNb1tu26Rny0LR/Ar
	IUP2HF+zczZWvfwvYJH4n94UmJ4W2SGjaLTYVSmHTuvGFhjh3s6YbdjMswfzDjpsWEP4H0Btuvw
	JDBEspaK31Lv8Pw8qttrvioGS2cmqcEyT4KPmSRbm8gwQfC5ujd33jR3LhvYt5bmcenFMAGMmde
	c9ZJFdYUyNIve8b47kJ0XJvpuEw+010KM/uhyZB3pjvpJcdRckdVvU1qyrCu9R8Lc9YXZUpuL0F
	DDDJzcAzO/IwRBlr4hqHzEnmwi2yW61UKIx7ap/9YqoDimrgSnggy1S5qxbjjwc49YbEHv1gDzb
	SH/zf6ffJJxpDC98+pKOBxwdM=
X-Received: by 2002:a05:6102:2821:b0:5f5:773f:b1e3 with SMTP id ada2fe7eead31-5f5773fb35amr738473137.11.1769426184956;
        Mon, 26 Jan 2026 03:16:24 -0800 (PST)
X-Received: by 2002:a05:6102:2821:b0:5f5:773f:b1e3 with SMTP id ada2fe7eead31-5f5773fb35amr738463137.11.1769426184484;
        Mon, 26 Jan 2026 03:16:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a22sm2706902e87.65.2026.01.26.03.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:16:23 -0800 (PST)
Date: Mon, 26 Jan 2026 13:16:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org
Subject: PCI: pcie-qcom.c mismerge(?) in next-20260123
Message-ID: <eui7aw3ge3gmeqtlpxuamqrrldgjxluwtqwvvdxbcj7eim2glt@57hzi37e3rfp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=69774d0a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=P6JkxrBpAAAA:8 a=i2sso159dxcEbW3x330A:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=dwOG0T2NmQ8MtARghG3a:22
X-Proofpoint-GUID: dSo8rpFlbeGeH6eUEJbpcBMzzw2u2xKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA5NiBTYWx0ZWRfX9aYM/zlhxTLk
 rXdZfosOlW3qDTvo3ZfEYShq38PAb4POeaZC5xySC4lgpcqo9UKi/9kKWFfSzxL5q/W7baW/Fty
 /iGCLUACKhCgUXBYqS0jrt1GkC65lEk4KRzq/hBpZqCnuDEt4FiNRh14mlrcZ1WCrPJq/E+O1cT
 /qqkeimohrP0uV/4tg2uUCkP4dNWBp5tPRLPrYAxRKj9s0+oQ8xYZxWC88JMlXP8jVIZafFHRcl
 hDCjhWG16bQLo3VR6rQReXTpdk2rooRhGCcUKg87awVJBMQicsRdMVyK0AV9JztHYqS/Ok7CpIQ
 0fQaBSkbx25iDLVKo8icBKfwgWCbcGXelXpdHRpZo8rTgWKh7G79Pk0M9pLjqysVM4BDiB6F+7s
 0uBWkHirPilqunPYGDkPaM4qUE/NDDIH7ozqTslhVyHLDaGM9peoreUsRj3WwN9uXgAA66qCV6Q
 qE+Jf2vu8Py9MpBLzmw==
X-Proofpoint-ORIG-GUID: dSo8rpFlbeGeH6eUEJbpcBMzzw2u2xKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90534-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3EB11878F9
X-Rspamd-Action: no action

Hello,

It seems, there is a mismerge (?) in drivers/pci/controller/dwc/pcie-qcom.c
in next-20260123. The next tree silently reboots during the boot on
Qualcomm RB3 Gen2 board, so does commit e4cfff34b9ad ("Merge branch
'next' of https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git").
Both of its parents boot successfully.

git bisect start
# status: waiting for both good and bad commits
# bad: [ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea] Add linux-next specific files for 20260123
git bisect bad ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
# status: waiting for good commit(s), bad commit known
# good: [8f0b4cce4481fb22653697cced8d0d04027cb1e8] Linux 6.19-rc1
git bisect good 8f0b4cce4481fb22653697cced8d0d04027cb1e8
# bad: [276b0cab7e6605fb7f393375342a8f1efb2fdcaa] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
git bisect bad 276b0cab7e6605fb7f393375342a8f1efb2fdcaa
# good: [bea0cb0fcdc2f127de75b2d587fedf31af8de18e] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
git bisect good bea0cb0fcdc2f127de75b2d587fedf31af8de18e
# good: [7d8322e4859e6fcd765b7c414548b001b7ea89e9] Merge branch 'xtensa-for-next' of https://github.com/jcmvbkbc/linux-xtensa.git
git bisect good 7d8322e4859e6fcd765b7c414548b001b7ea89e9
# bad: [e4cfff34b9adba701c5f26bed4eeef18921f01b1] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
git bisect bad e4cfff34b9adba701c5f26bed4eeef18921f01b1
# good: [58c8b8169ab8a5bea68e081904639fbe950b8266] Merge branch 'linux-next' of git://git.linux-nfs.org/projects/anna/linux-nfs.git
git bisect good 58c8b8169ab8a5bea68e081904639fbe950b8266
# good: [b860f2580770b1129205f140ea3e4b9dae6eb59c] Merge branch 'vfs.all' of https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
git bisect good b860f2580770b1129205f140ea3e4b9dae6eb59c
# good: [97b9a441153a59b9556de8cfa21f0e978ff4b927] Merge branch 'pci/controller/dwc-imx6'
git bisect good 97b9a441153a59b9556de8cfa21f0e978ff4b927
# good: [f770e4c1a488edb5ea96cce67f41607c259d704c] do_fchownat(): unspaghettify a bit...
git bisect good f770e4c1a488edb5ea96cce67f41607c259d704c
# good: [a8d9c82119633a741d44f4955b86caa4710a7102] Merge branch 'pci/controller/misc'
git bisect good a8d9c82119633a741d44f4955b86caa4710a7102
# good: [abb0434496c4299223f69bcb07174dee2e764bec] mqueue: switch to CLASS(filename)
git bisect good abb0434496c4299223f69bcb07174dee2e764bec
# good: [66d7b69cfc189c7e14234327398fb737bb56dea2] Merge branch 'fs-next' of linux-next
git bisect good 66d7b69cfc189c7e14234327398fb737bb56dea2
# good: [62d82b19b194120643f71281995bf12aa3f17c2b] Merge branch 'pci/misc'
git bisect good 62d82b19b194120643f71281995bf12aa3f17c2b
# good: [34793812e59224a3ba0dbe9383a5b6aea7b2fd5a] Merge branch 'rework/atomic-flush-softlockup' into for-next
git bisect good 34793812e59224a3ba0dbe9383a5b6aea7b2fd5a
# good: [4a2f8feaa278e58fd623a4dc706c3b8cc35867ad] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
git bisect good 4a2f8feaa278e58fd623a4dc706c3b8cc35867ad
# first bad commit: [e4cfff34b9adba701c5f26bed4eeef18921f01b1] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git



-- 
With best wishes
Dmitry

