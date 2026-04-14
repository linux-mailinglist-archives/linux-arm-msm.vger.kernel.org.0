Return-Path: <linux-arm-msm+bounces-103194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF0pMyJ/3mm/EwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:53:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010D3FD4D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC36430D3A6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EBA3090D5;
	Tue, 14 Apr 2026 17:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUveyinP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoL1HOLC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B052D299A87
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188860; cv=none; b=eHh789strdPXId4MNfHQUquUeXfajGW0YnkKqdE4cOnNoIs/gaDjongCaxYKfnXawcDo3hZVWFoo8isiams+da9RAcNyUwwUdN6wVn1/OxUGKNUaY6tqYuJmvTrcOX9ke0tA//YNtfzSCyWaGTDvtMDHB7Tk4k3NlwtV3dhnOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188860; c=relaxed/simple;
	bh=sbHR1rCEAF5+p7nGhZgXKdMzGgrIdalpdSavKNQMrGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qigDVHjcVEbD28fqUMepUouVeHZxMVL2rLIx66f7XQPRw0w2YD28CWUXDlILTq9V4XNEVGTufDokqeFgnfXAXj4EFYobwQsjC1pJZR++Hu4+ypxH7eZIfhdOh8Iaoj5Hi+DOYTAIdUAyu/dc3IZ/hZJoJUVz/NoEK7EazFCzqcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUveyinP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoL1HOLC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBl8vC3505282
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fIysXbHVdbDHIRrNfD8gUrC8
	tNZD2pCNsJSliIQfnW8=; b=OUveyinPJ3DC89CYHJHZxuqMq6S6520aPZo2tTPa
	WSfB8/4Wsy3rU/sMvflJZ19/GSuU7bqz5hZu8mMAfRHU0ahG5CfSrI8nFR+1Jm7q
	Uy8y0w5Z3M0WAQe8dwDRu0kWysjbj2OGQi+B0b8Wawoe66i/f+Rr0rsNNeOz1wtd
	lAgaL3px7jmML1dqWWJmBwgUuWMzAmCjVsNxRNwqsB1zo0PVCb3GtJ4lbMRg9rX0
	JbMuRfbkcBlu3RrBNs9b6zctTrQzuoc7XcxLC+V2krEDkCvMsaxdSLtR+0UePwjA
	zgy2snPMMRRoVC5tZTc/+wIDzJYuP5JPO9+mmCIjUssOhA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870kxtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:47:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso152091881cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776188858; x=1776793658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIysXbHVdbDHIRrNfD8gUrC8tNZD2pCNsJSliIQfnW8=;
        b=BoL1HOLCNT/w/TAVBjZw3T1wk+GfVcEHkkisPWszD2YkeCYQNX+JPi1GNrHnAxOcya
         rTvq/XDPq0536xn24/n7ab+HVB+CFbtOZGvR4xajTaMiJP55spm/YWD529KkV/IF7ypY
         6pToEVauhBS4Kpcy6z8GcZGzDX5zi1kr2kYJDZegt91aSxiG7sY2RA1z/6ui4GU3NTtw
         jahiFCFIWDmzS9xse7vUjs1oLDxe9F+Pb0+etlWbOiGHQ5csRTl6us++n9NkhfpvLj+c
         Mjsb8bh2WYvECXfRhcb2HphwcOmrNKbbeH+Bg/um31OY2M+Jv/mG8090AJHAoiuLSqqt
         ZOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776188858; x=1776793658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIysXbHVdbDHIRrNfD8gUrC8tNZD2pCNsJSliIQfnW8=;
        b=CV7JDkYB2luSxAg4e1R3ks0VdvOFt73g0vRJxOSMhjffqB4WuZ0X7aoGWfgMow1F3z
         /IGwfT82m0qYGO713PtG5igFZ/FxK8NRx8ISb23CWwrPZxP2k+Xbw5cFgEvvFB6Uvvah
         tmTJ50dIbrkda5l6TvNbmU0cVxFTaFRDPlCZ+09np69SZhlI+Tw2De177LSsqIsVMRmv
         NCyGB2d4gmyMUflgQkCaaiQqWD03cRjR6JgYHzVJyuoJCUH8zO9h82i0wHe1Zop/w6i7
         kPX9beK61Wf7hceIiMirrWWP6Y5skG6aF/JnAR179XqvMFIftoyC0hsI0wuKY3o7yV9U
         n5Ag==
X-Forwarded-Encrypted: i=1; AFNElJ/5QBI5ob2Is7AfByfCk4AFQS5nY1t9lE4bAO5TU3sa5KDu7kvkkpP6BsrKlWdlS/yOGOw8h+rlw/Jt0Qk3@vger.kernel.org
X-Gm-Message-State: AOJu0YxuL3SZbZytsgVOOeWxLH36+HKtzfSy6f3YNzb0SRjLtpmYemIi
	WZIk99DMkIOJkqkWLPZmZdxwvWamWmpk6laYGlPQ0HaBPsqU0qpcDsysCmGCsBMeVLVdDvsEagW
	471M1qL9PSvJMyJBQJ2/OvAhCiTEjJ5966qta05+pcxbkgajXKHXupim02mDk6bkc0DwH
X-Gm-Gg: AeBDieujgw0sY4wdcCXcCA+1rVw16045LzImQDcP8UK5uPCzjzc+qqKdcekJfZhsPyB
	bpB3ER7ZsmXePzkm/y7qqltn7LkkJ43ZLK4FFz9ajGJ+67iAFZGI4gwphwi0w3nUnxfMA4h9OXE
	5l8flF1Bf5TKbZqhQgJvfgp/7kQulslNAvaj2t+IHK5cm+EtgIVSVs0HZdiZ2MAo+dhQsuLQ1Oq
	aNwGh7H0ConoXpvOx1JDu9BN6EjTnTLs/WdPn8tbKIAK8rKzqAHzQm7xPULAVDx6KD+lMcHrlGq
	fAVkM5YoZUIPfHYAVggbJznfLA1+aZeY7M/+S1LP+UDywVxa6ifj/Bn7ksHQHs8jfzjIFm98lHX
	sxHOPneH8ceQ3UbrkC7xTEGw6KP8uEWtMFyuzAfTJstYMOvhD3H/cfJlDZ1YG8ouqB9jWb903zi
	hSTOplMTca7z3BP+agS4+Uj/0LOwaZT3IxpWxdoeZUaZUlHQ==
X-Received: by 2002:a05:622a:1344:b0:50b:496c:baa8 with SMTP id d75a77b69052e-50dd5c3df8bmr263789091cf.29.1776188857968;
        Tue, 14 Apr 2026 10:47:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1344:b0:50b:496c:baa8 with SMTP id d75a77b69052e-50dd5c3df8bmr263788501cf.29.1776188857494;
        Tue, 14 Apr 2026 10:47:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef0b4c6sm3480555e87.84.2026.04.14.10.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:47:36 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:47:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
Message-ID: <6awjhtzjsvtustjp4ghy7dyiujzrkbu6szq3iorsk2og7jhyr7@nmkzfejq7upb>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-3-bcca40de4b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-spi-nor-v2-3-bcca40de4b5f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NiBTYWx0ZWRfXxiR2c1In3ZC7
 M2MtPK6dTsRMljWQDqfPPmZIZCWUbAijLnyoXfBj73nbAhl6KIePdLZlPFmKmZUOWZeiHIHKLUY
 2NniKUtZYUCRuMTEn6FaU7g3HQqaS4IoubMV32/kmjUCFzfGzfZanZwBWqpUHnYVAxIQawdBHpI
 ueaxDYP6mCRopaIGe/UT6YGSvuySgkPnh3xPEDaE1ar+R4ThGDXqc+1dwtGcrQtQDIy6QK0WCXZ
 33r5p+yvsZvE08GyAES3KwE9XW2mSedqosWn2K9uvYp7tITNvvvj/LU7Zn7Terz3pqhXCpE5Nzw
 QbaAPk72EvHevW7mPOHhz2sSbjzx2tsoJzkl0iAJo0XQ9CslgFpZmleL/bPz9OLGcsnsapc44y6
 FAETa8f4tD606F2uuTzUj2LV96RyXnEbxA4B79sxw0K0Rdu8T/3W0qhmctyTB3rXfGE9KX3EOlP
 5eYuOjJiP5lDomiCOyg==
X-Proofpoint-ORIG-GUID: MdJKxakpn889_vuRYbSo9_Faa1U3DGAf
X-Proofpoint-GUID: MdJKxakpn889_vuRYbSo9_Faa1U3DGAf
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de7dbb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=HcHoBLZgMIbup_Q7xnoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140166
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103194-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7010D3FD4D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:38:21PM +0530, Viken Dadhaniya wrote:
> The QSPI controller has two interconnect paths:
> 1. qspi-config: CPU to QSPI controller for register access
> 2. qspi-memory: QSPI controller to memory for DMA operations
> 
> Currently, the driver only manages the qspi-config path. Add support for
> the qspi-memory path to ensure proper bandwidth allocation for QSPI data
> transfers to/from memory. Enable and disable both paths during runtime PM
> transitions.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  drivers/spi/spi-qcom-qspi.c | 41 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

