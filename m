Return-Path: <linux-arm-msm+bounces-112800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zgX7FBIPK2rz1wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 21:40:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A188674CAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 21:40:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZZa+QAX6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eoeUuo3t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112800-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112800-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53CF430AE73D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92980371D14;
	Thu, 11 Jun 2026 19:38:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E637268D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 19:38:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206701; cv=none; b=eELawHDu06Gj23wb5UwBZQny72bPrzaPHOwrj+Xtx19RtoGdWoasNiurhQ4oElaSCscdFWLxc0l1cafLVrarIx/PIHZDVCGc84CHXWdkJ0SIlSUoeIpWcB+owid4O4+KHOrwcXr+hwtCUfkzJf4DtQHlv/5QGW2ENhJ9TDFBRvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206701; c=relaxed/simple;
	bh=7hkSjJY+5qAalIOMNN16ZBL3kqqDiL70XFRIEDhKuTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YW9ycN51Ro8Nq/iy8IkuHIrNPILkCehMpViq85xFmAJ0xuG0YDp1cny8YSJ9+pElLYLyuUm95KP856f7twEB3CwBBLDP62k4nVcToJLvg1szTB4v/qDbc6x1rzjfzoBgrqVhnbYEXELajmEEW7LTbED8Ae+b22C/1OS57mDlMIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZa+QAX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoeUuo3t; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3L651527044
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 19:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1sL1PtUuVLMR9wGjll9GVuJI
	vYSgxoz9V0tlbCz4Lck=; b=ZZa+QAX6SgDEMEqshtNxda1HmlXfXWvFPXh8iILg
	N42/DCuaXBP6bZdHBDn1HevC3o8ZN5VloMbmENMYou/TrzPHZjxKVHWvPmjpUVUC
	yZKB9Q7K1qoWbMydCIbXmEhDBUo4Qjcf9exFGUuHUwmN8w/Nggv+Ekt3l54bIPdS
	ia1oMMiL3Xc7duacc9+7NFgSHWr5vJYRVUvQvZT1mVgEynHRy8WYruSxBZZUg2jo
	nNZ+VwbLpd4oYCTU7R6MZ1eq4ThEmqCDhG+fbFe9ok/N9xUIDnxxKJnOv76TByue
	pCBqhe9a+gytHK65M8OaI9bHJs5WL6bdPdwdXTg4JWhoaA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29ur9m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 19:38:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c69c788ce7so72466137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781206697; x=1781811497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1sL1PtUuVLMR9wGjll9GVuJIvYSgxoz9V0tlbCz4Lck=;
        b=eoeUuo3tpWoqEcv8TyQnRXSkYAjBfas/Tio8m7/fjDZjAQ+05c0XwsZky66un3izmp
         /5fexGea1+htdfkB66x0lLnXelTm5+3SdlBKlxzDmRWnbAQdLpBs2Re1Ao1I5kfcrqri
         H8Y7Zs7mpV4ZXUtM5uFWrXYWGUDUMvH0HZcf+XNwlCK6RTfb/82j7W7Rdmo63ydS+Uvc
         DNfh4fNc4/W/awSf515gsS6vQEfO32R2KXNBCKXlTPnUiGOSC+AGiq6Uttas10DLWRL2
         ejMT3QqLnL8FAoT4tuk/bf5S3RMq9OeJMBM4RhiosfN+e6xWSDq2CDENIGgghIQMtg1C
         9McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781206697; x=1781811497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sL1PtUuVLMR9wGjll9GVuJIvYSgxoz9V0tlbCz4Lck=;
        b=WwpPwSbpI2ETt6WC2I1XtViwBqhwvWazYUDUL44PrzQATJ/OjjQz2Ga27PFQmC9C6i
         qo78RnlQqmvaxIv/VMXHi0Oe2qHK6JvEmtO/9s3w7t3ycTkR3pZm6JA9Xg/d4X2EuvQd
         MsxE7Cn3sTlX52jY3p8oHqFvblntmVJJ7obHYdDA232NFOerUEt42zk+4m07FfBjXO9p
         9D5FXi4rAR3aPqU4z0b0nEO2cXdYf863ZpUvus0FAruOPkvrY9wlRIT0c7fJBbnTok8u
         jkihnDqf3f1tIEPgba15Xm54DAJNKaXyjNG50dwakffV31WQ+3Tm32VAuZHBgjmJ+gfz
         SgbA==
X-Forwarded-Encrypted: i=1; AFNElJ/rbWac198LkZDQJ+Q743e0UqqP8nfrJtP0d21LUu0KcP9PNDcmpO87Dbe/PVyWmLdicm/Y6Wv1xIJicKxf@vger.kernel.org
X-Gm-Message-State: AOJu0YxGtnhNmiPvDmDCMsA6tLguqt6QtUNIM4trPqCGshnmDBYLHcKJ
	yxcL2DgyXUBpYE3ChqY9bp3l0/GC+kwFJQ0TEc7YBv4fyrwIZQXR5L1KPnHhTpRGzF6r2eeOnKh
	nueUB2sZ7x8oK2Zgic+FMmUR0jU1OJCti9Uecm9laoLLr5BEAYup2DQ/9W60HSe3s9BjI
X-Gm-Gg: Acq92OE3sb3mOYZcZlwXw8DXRy4WZ6QSwCETXV7wITQXgEMJRy8xlEm25sqilqh49oU
	8kzxoZwe7LBPc1kXwCfRrCIYVf4ZrpbweRTBsHQJbpZ2aNxncI5ErW5LTzcoUQhi+0D7+X56dLE
	OnrsPpTzf5FUjL0yV+NkPN6TMCCGUcTclW57ehluLYxdga7dWegad05y3n/B2s5ZHEjBWlDSjrX
	vtjfAcelAPxObPbnp4guHBKn8UfSVvEdNOZIlzWdTkSrdrynK2ybzGfoRd4CvmkSCEq9YaAgx/v
	kL1I1yKTqpSlinSXuvY6FPYQCzbIRuPZE1poVj5TyR+o4JWG4uRN4Ul3NBwajngzJfV8pjX28/v
	HC25m4jDSGt7et6jBwXoC4I1Jh5ao9Kr881EF+/2q5wLyuZvR0MLufFof+2RzWyVHBvpWNZgVLz
	IY/12D63XIBzu2Gtm4C1ycHMf2eRWeRI3SCF4=
X-Received: by 2002:a05:6102:5e86:b0:631:26f6:7009 with SMTP id ada2fe7eead31-71d5fbc840cmr2904825137.26.1781206696784;
        Thu, 11 Jun 2026 12:38:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5e86:b0:631:26f6:7009 with SMTP id ada2fe7eead31-71d5fbc840cmr2904810137.26.1781206696303;
        Thu, 11 Jun 2026 12:38:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd966a8sm94272e87.70.2026.06.11.12.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:38:14 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:38:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, usb4-upstream@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
Message-ID: <c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
References: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
 <178093139446.244194.9422100472802070367.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178093139446.244194.9422100472802070367.b4-ty@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5NyBTYWx0ZWRfX45JFuRDFDBBg
 ZSIlwJxCzdITLnqd40QLL4GsjPOmYOqssokIWfwls2JwOhCkP9YDj03rYA2IkSFgng/opOGkJ07
 T95QGAPhuB46ZDN2KlMcC9PSypfE2JQ=
X-Proofpoint-GUID: pqs79erymhYUATtSOBBbpaaxVTf2fIG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5NyBTYWx0ZWRfX2a2rl3EYIXpF
 u+/9R2l5wVe+jlJrcGawSOavp8kP83XyLTSn4qOmeH73D+bJtWtLll+rBZJ6X2DllwmwjgcKZgj
 UHyXZYnt7eNYrs5a2pWxdDt3Pmxw9OV5cw1VQVdQNVI1VZxCFl1RNo5lWsES1Ki46kupic42mDI
 m9fTVzqmPKNtauc9FaEYv3E8r/omz8uVHACnCuw6CJWeoXiVAm0AwhEGFvGdO1tutsqBwQttRq6
 cn6RM64Ms32pwErC0EBYa9cVlCmxS0MRoOUSYk6kCXJCMYSpLxphST5pl0G57EKK666dNbu1MaF
 cIkbZ4nioHiaYnLquzw3SwvYSAdj5tWd8rBo+dhcSD02YPbJ6cDKDGB50Vwf7PNT6nXvFcLfXeE
 UIalZHFLzQpn/6pa9HSwLNLRuCWsRBzwkTnGQrp1IqF8wpGdch501mUgF1U1eOT9eABLraqRsqb
 +Sshj4TqUPPcB+d8oVQ==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b0ea9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=fRhqCqpcSqVtSrmxR4wA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: pqs79erymhYUATtSOBBbpaaxVTf2fIG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,jy4h7fkwqwjg:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:konradybcio@kernel.org,m:usb4-upstream@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A188674CAC

On Mon, Jun 08, 2026 at 10:09:55AM -0500, Bjorn Andersson wrote:
> 
> On Thu, 09 Apr 2026 13:57:45 +0200, Konrad Dybcio wrote:
> > The sole reason this hw exists is to let the branch clock downstream of
> > it keep running, with the PHY disengaged. This is not possible with the
> > current implementation, as the enabled status is hijacked to mean
> > "enabled" = "use fast/PHY source" and "disabled" = "use XO source".
> > 
> > This is an issue, since the mux enable state follows that of the child
> > branch, making the desired "child enabled, MUX @ XO" combination
> > impossible.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] clk: qcom: regmap-phy-mux: Rework the implementation
>       commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c

This breaks at PCIe at least on SM8350. The attached WiFi card is
not detected anymore. Rewerting the patch makes it work again.

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

-- 
With best wishes
Dmitry

