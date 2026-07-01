Return-Path: <linux-arm-msm+bounces-115567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Ji4EvqgRGqsyAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 07:09:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F96E9C7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 07:09:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YNsoFjKW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TzS8CZlq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115567-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115567-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C5F9303BDDB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 05:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71043749E0;
	Wed,  1 Jul 2026 05:09:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677C361DA7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 05:09:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782882547; cv=none; b=JCNOlqAMrexF6F7PKbv07TdQjBPqGg8TL9Dbi0f0yfhS0UsmiQ/Np0+lxy/NdRCRFD750fiMgPuU5CUUXwAETyfFmkw6ODCYcTNNvrGqKsFYTnwqXg+xCiwI3iFM3HtpWJ9cThDvgHqA2ODU6o8k8RcGRPZRAZl5acHNjPVrROE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782882547; c=relaxed/simple;
	bh=b5bS/XUZQqxfbtxJ0nwEBPprnZ0wRRmwWRoZ9SFI4UQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JVneoFo8w1LJujHTc+m50GZhq5boLsK/jfGoHqKfshMKmjexv78eJdFszxIi86UGdSrHQoCaRI1/A1xIYaFV5+WOGloXvC6oeXll//5ahdCVcY/Z3x3M5/zR4ZNLfDcoO0Pjkooe1ezA0DW2NSmo6g2yfsj/SzQmQ06wXgYVpx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNsoFjKW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzS8CZlq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6612teWM3869305
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 05:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVVOQL/lgmh0sWaPzQjFGlDDDqCURU093IoiySwnHEQ=; b=YNsoFjKWulKP/H1R
	Sq1lqLOAZ/Cj658Tv3eBbS2qTvNtiw7iwtvBoD6u3YMWyLGGniS++Ta+J1r3FelA
	cUXAAvoeqfkfDvbLzTyB3rI1FKiu6oLI5P2ONxiU4U+Qeu2rkfmdpsWJx4lloaJO
	kzoEj5HbBxyiL1a+1PCvvpOF0XA+JxG0l5xHqoCUL5izCIZX77k5tFL/Z5dD4dre
	i0TShRdp8iODJhulH5PayYCpyPfv4PJZiepaZ4Yfc4BZJgqVrkXg2cvqQzmyBu0C
	YvajW+pKjLCQrPQ2uykQDgTCj6NN87OmDq3E5BjGUdrJ72mi4JebfwS++YIFKHCE
	UhfMdw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sj53a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:09:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ed9113e03so101621eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 22:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782882543; x=1783487343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVVOQL/lgmh0sWaPzQjFGlDDDqCURU093IoiySwnHEQ=;
        b=TzS8CZlqWdukBTWPNbDRPY2nTJhQG2tGWNKG+BkbZckhjxTu7BVyTPT4ezLd31XUYM
         3p5PnMc5Lj5U1D3Kmutm1QLKPSKX7jVQk8ov07mqz83lKFIjEqzAc9+bdcpMiOQLwZY/
         Gw5qzEVgbDBCH8aMycQibCYZELipEL0Y9TxPu0PxBZFl8HGTFDJETi374MarkZXppeGB
         S0LZQf03gXTvrj4jhmXlIRpZWiE2Db33LedShY/drcDW3wndWVpb7xQyo12+BYjEUOAM
         3/42g8dxHaTyinRxbwgYcawrfWdInXxBl4WFKe7xW4kFjp+Kl7LCZkKMnAB/KUhkSLAn
         w5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782882543; x=1783487343;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVVOQL/lgmh0sWaPzQjFGlDDDqCURU093IoiySwnHEQ=;
        b=VfyZwP9VTVwQFRe9ScV12Gv4k8GS8Vlc10oi/Q/kU+NHrebGwUVUgBy3H9FkZfq016
         uq6wMcxaGz9f2nxYtpZwPDSVWQj2mG0u0hFHmx2t3+NdM6Dna0oKgL3dpGxotG0c99NS
         c8vxuT4h+FWjEmzMecnodvJMJVHsDKy/L4F20GMU53Qt9ORV6OrlJkp+p23M7FBNRDV9
         dCFIMLIVfN+o/aDMwTCqapf4T6kAsTahF0CG7ncYGNfB34w3GwFDx1kW1wIsNcljR/W/
         hXwqDzm2mRHPaTC5eTv7/+izKvOiVAFBES7fLULW7PoEp+Bf/SQo6grkX1jSuuiKCwdO
         dPZQ==
X-Gm-Message-State: AOJu0Yyrp+5tE8bx6G/wRkjdsTk7fauLMvNy95CT+3Qip3nh3S4umnOx
	K+aufsLpIz0lkR7V2vxW0hIRcTd7AltJJALxTDoXBo5pUoiDeit/movo8CtHN72ERlmwLmavg9n
	FkFD9txu/MT2TCQ00kwWKLSrh5/u+KIfELOsUfBH9GqFapoK6R0hKUbLukAxiaWN1NQsxpTQFwH
	JI
X-Gm-Gg: AfdE7ckI7fpJE2L2Pjj2BEGdshl0FqM7/qP73TvGqKbHR++n0jJz4Zqw6YeaIfEdlNS
	xtryxA3Z3yuc0+ZqL8A733MYcOqXlhwRXJjFSi4pBbsi5qkfeZJcNfcmItgksexN2hm0Z3E0Dfe
	gAfyOcqG1xjeSxgs8JB9QX/0m7s6HiGYw7hcYeku2Kdrm+qpJM1IA6MdaJ8NQGPutCZn/eDFYZH
	MR5VnCLbIqUg7QuaTYqfe9UA+9Hb59+BHwonkcs7gWjsE3l8tADp8YgG5KMpYEdeYnXvuHSHnJa
	EtdFBALoxf6aalEwS5KfCeXrpfDydY+C2UFg7Ak9kkLzW7TC1rvLzSOcK3qPPT7EqeNyFi9h1zw
	quyupaRok+tPhYttChMjjOKfYv6srPA==
X-Received: by 2002:a05:7300:e60e:b0:30e:fdd1:faa7 with SMTP id 5a478bee46e88-30efe947724mr250938eec.16.1782882543388;
        Tue, 30 Jun 2026 22:09:03 -0700 (PDT)
X-Received: by 2002:a05:7300:e60e:b0:30e:fdd1:faa7 with SMTP id 5a478bee46e88-30efe947724mr250883eec.16.1782882542121;
        Tue, 30 Jun 2026 22:09:02 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.61.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee326c7a7sm15553098eec.29.2026.06.30.22.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:09:01 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260616-pci-qcom-perst-fix-v1-1-27600d6ae357@oss.qualcomm.com>
References: <20260616-pci-qcom-perst-fix-v1-1-27600d6ae357@oss.qualcomm.com>
Subject: Re: [PATCH] PCI: qcom: Skip PERST# GPIOs provided by downstream
 PCIe devices
Message-Id: <178288253875.309343.13111797439602870400.b4-ty@b4>
Date: Wed, 01 Jul 2026 07:08:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: nH4YuQ8xi2nhmsskjdTG1nevZmJ_2JyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1MCBTYWx0ZWRfX/YWleV9RwnZt
 Wt3GTN6BdAb19qkzWj3/eMa3uau2avJlY87Q/dWiQuRxjrogNJ+MRvvjgfKuJDoGqpUhbIp+qx/
 XLj3g85FGd+8kLPHZS3hTHh53SjWHOz62IN55ao45PFUu1ppHhJD1QJdZLngQFGWE1eeegFDHc5
 LxQdjAi5sb5SsAyHnWKd5m5gWK8WFwhJFPyBnDLbCiJJP4J4FFgXoXrd+X6ghyes8XKa9qIDC5W
 H5P01wENafNjyapr3Bio3K7DqAS2RIsmbviExIh1SKoqkhcaeFXV+fZDLx+2J1NAoOMVp4p6hpW
 QEFfN+y6A4E1QVWuK/Jv5n3Zf/Calyr5WyBHPyuL1iy3Zp9jrW4Z+U0DN+cCx9+ypnjBUVg2fdm
 d7qKb801Rq+m2AJeBtgA3h+0dpwSWSQnvefi5Vvmgf2IcBKK0pVdxKEvOqqvbJV1Pid7tUa3a2f
 nOGmKFARKVnU8w2aWkg==
X-Proofpoint-ORIG-GUID: nH4YuQ8xi2nhmsskjdTG1nevZmJ_2JyN
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44a0f1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=H7IkG6lIOHbWVTtTQWLpKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bqNSvqPU_hI_hxIsaqAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1MCBTYWx0ZWRfX6icweXXkjol6
 BOle9PYPQ03JbeUoPQn29P1SIGCEQc1KaF0ood/fTblaexPumuvEuiepcN1qf0+Fdbz6jkMIvEZ
 slFJAP18f65TIFeQaSm+zEo6yVZPW40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115567-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:manivannan.sadhasivam@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C68F96E9C7E


On Tue, 16 Jun 2026 21:45:19 +0530, Manivannan Sadhasivam wrote:
> Currently, the pcie-qcom driver recursively parses the PERST# GPIO from all
> child nodes defined in DT and acquires them. But this creates issues with
> PERST# GPIO provided by one of the child devices like the PCIe switch port.
> In this case, the RC driver cannot acquire the PERST# GPIO since it will be
> provided by the child PCIe device which was not yet enumerated during RC
> driver probe.
> 
> [...]

Applied, thanks!

[1/1] PCI: qcom: Skip PERST# GPIOs provided by downstream PCIe devices
      commit: 1133089b07785841258623e6337c9d89d7913638

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



