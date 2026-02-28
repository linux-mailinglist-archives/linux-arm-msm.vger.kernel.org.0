Return-Path: <linux-arm-msm+bounces-94632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM7RNIheo2myBQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:30:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCBD1C91EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7411E30B30A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 19:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FC63CCA1E;
	Sat, 28 Feb 2026 18:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ya47MqSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUGrfT9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB513CCA1A
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772304517; cv=none; b=gk7Wl79NR0fJEOYVTN6P/shlfXs9A13hcH/gIrhXq2epHY46kx/K6fI5e6+XHus/V5Q8jjId+i6Zs4Fq14Mpc0zoNsLWiuiv0VUzvXlk2658fTndjVtbnZKErov8d6EfJAicSGBKLqmlxfptXRPHg1kuy52vMR8SXorl383XAOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772304517; c=relaxed/simple;
	bh=evzbvj1FFw9uTlu2/0oOrxQHESpMnbP4gG7gpYZ/DMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roBE/KI2IVoQV1mCmh7iLKjeXiz2rskRqI1h0W9fhSRz9Df6S0oJEob3j0RvdHYCbxmGogdrCEQhmfdubhCZ1rVeNvSitcBSS//6sZF6oeEOktIDG3K7IuEOHgqtHT380jB+t1kLmHRtcgkM134VCGhMIPNledL3KTXruDuOFzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ya47MqSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUGrfT9H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH00uQ3093957
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 18:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7SsxqufDnxXxfwGzodPcBFJM
	M0JrwS1ePDuB38q9kgg=; b=Ya47MqSh+z1JnI/g5mZK2P6ugjEGOtITH8rGS5Dv
	d/yS1jvzCkfvFm9znv/Ox+naExF3o8BKo9Fmrxh/pSZcmOmTg6oxT5eBV1JffA2a
	ivDCZUa6iBu7yaNAWhiY5pF5/q/XoUftApe/oJPRk6kfCiK63XMgQisWqMglBc15
	Oqfo5a3tWLixtNW2WToqDiHLQPtwJeIksrNNfJP7AbMYo/VqoTkkjdpyyZbnqhT1
	o2IvIdHKJbjt62ssGI98kZWXuQfLD/q5zf24KIwCFm9fURLZ22b9A4sqrqUMkSCk
	sYgghdAqUqBrGeN1L+n2zo0K9F9oFh7r1IHs4iLTNbCfMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq1g1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 18:48:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so318493785a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 10:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772304515; x=1772909315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SsxqufDnxXxfwGzodPcBFJMM0JrwS1ePDuB38q9kgg=;
        b=WUGrfT9HHKeiNh+gaxUNRBPL1ykf4mv1mEQQFj2lI71Uty80o7KBruyAoHqZECp/DN
         Bx3GqqXU0qvbvpSc2z/IhL1ACPMNut+3FF/a/tLJclrGa6kaLahufKjTJWo95nDOrA2X
         lMbCLGq7pJbG4uXo8ZVOclOouYVN4QT8orQUXAgJvdcnMlnkgoj0j4HBlkwQcjzHxCtX
         IdxNfWixgPYGEJUARwxunMx7UuApnLle6asXktO9bGJCUADrjva6n5Bn/WYCYEWRO3Ky
         JpW2+zhiJE/s6PjFjDkftGu476Cxgcl8nNliFgE5eKW02bKIA2xWH0nuyri1arhKUxwb
         UCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772304515; x=1772909315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SsxqufDnxXxfwGzodPcBFJMM0JrwS1ePDuB38q9kgg=;
        b=hjDxbNL06Ld4Bs7cXOSg7KYNUaya0VqBlM+ky+pCvKPqko1kA87dU3BwlzeaYOrq/k
         duTOay9FXl9CFzCpF4FZQTFFb7cuN7BgNjpvVGnnlZBIbY3GNnVFwurvQMtm5DVN40hz
         M9vjk2VZrfgT48j1aPRPIalaMmXDlvU2xM5qMyqcLXnYwpAqdv8vx8O6ztCz3uHFSt+u
         QTZ2OssXH1AzobDIH2t105+6S87zzNDkxAD7WGqtbdpE2pwR3Ri+/I8LoVY7UupQeTgz
         cxHVNF+E38Mospd+0U70W+TTkLKwA/CxFTR60WWg8M48havRAfMmi1nYIobk4/c+KTc0
         723A==
X-Forwarded-Encrypted: i=1; AJvYcCU1dn3rew2ENr7uicDbqrIPaYeV06rLBtzERm3FFAqyRXGRW+O2Fn3VTLDv977nI+6Od8sAGf3tnZmDUCH0@vger.kernel.org
X-Gm-Message-State: AOJu0YzGRBh5Di4bkokPiV2zSl0txnNnK/ptBfd2zD1qXK5SoBUmCWzT
	R20JVqAsJuYn5l6fSwxMHYit4fNxOKsrnFe9BQZAqE8HEEVD+jDxIzNiAEGojjRZEf6A9NXg5JX
	+Mv/VQWL2bjkGFVONITOqEHNjT9pMu85z2rOTnFSnXI4MgI+HeR988psKE9nPo+pwTBmM
X-Gm-Gg: ATEYQzz6M1YQWUEZ/tc9sGrVutxm5s3LWZ/QnufSXzdF7CrEaPZAYJD8ogxv8jynq0O
	35Pfe7UXqYE6nP1F/v5mp4W4PYyELZsx143WMp/1uoPQjky5ns86NaSViPBb8TaDdl7gj2C83+i
	csbx7oqmoO5ZZDgq8JPM0fyeXTnLMU66boRdEqRnNSSwnr6AvTZPM1bnRZPn+h2qiYs3p2xlwvB
	mcw0z0LDoozFJYEzVIK7uGgP6j9TIPmk5Kc5+J1GmVjcn3A+BTEScoxMRnDZGVqw6jdQCj6TB9U
	vN3HN8+4R6OxVyIyT4v/OjjwE0jGdHGHmDhC5q+UR66cSq3hgxk8VLwxu7HoxYMQRLjDmY/ACrh
	2i4VZQHzt76O+hZ+uLYRnrEXB+Uoe5FC5o9+U
X-Received: by 2002:a05:620a:280b:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cbc8f160b4mr862117485a.52.1772304514624;
        Sat, 28 Feb 2026 10:48:34 -0800 (PST)
X-Received: by 2002:a05:620a:280b:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cbc8f160b4mr862114685a.52.1772304513989;
        Sat, 28 Feb 2026 10:48:33 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df90sm307912975e9.14.2026.02.28.10.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 10:48:33 -0800 (PST)
Date: Sat, 28 Feb 2026 20:48:31 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Message-ID: <vjcnvat5ge2ttfuuvtnbdny35jctnl6h2hgkksabui6hnwmxbi@dkobube3ynbx>
References: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
X-Proofpoint-GUID: FOqzN-1VoQxjeg0w4jh8-_UV1lxHuSbJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE3NCBTYWx0ZWRfX8T6AQ9jNQaJ3
 H9EU5NOWlYdQcDI8oLXlqi3BNwM8rWzbtQmfGhtWuzTmpKZHLM2rFJsI9pSkQKVj3cGA8Tzgsbb
 Q/teO7jirZN9Vp9lgR3XMeqh2qTsjHyG+pdLTnENdueBUuXH81lIXiLDqIvEG05gfqzZVmnd1H9
 U+VIrjiyhPOB4u+FSv0A9pRKAE4HddcwzKpa2MtTg/3g7TLQlk6/36EANHgRH8YNGGz3jdoPIz6
 ZZ2MiG70dCcorCGN2QhZT/SANMVTKpbxDDwUoF8sumUzJinPHM2Y5VGd40jZ/W1eLU9bdUeZVm1
 cwlWtQODlpUzOeqiozqLOHlJ7UTvdp5yHbN6fZJ3scSTCdVFI5FuJfWRJmiVbbQqwVELZjwQig9
 rWIa+1jc6EtXzECTj5LaPf/XkgjIaz7XCyjK0lDZsTKOoWd3igSAmgZ0hY6ZqSol4ZVkE6aNKfm
 WMrtZ1xB525LfM3CPWw==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a33883 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tJH15bp18cgGOWU3wh0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: FOqzN-1VoQxjeg0w4jh8-_UV1lxHuSbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_06,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280174
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94632-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACCBD1C91EC
X-Rspamd-Action: no action

On 26-02-28 20:34:27, Dmitry Baryshkov wrote:
> Due to the way the DDR controller is organized on Glymur, hardware
> engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> Follow that recommendation.
> 
> Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

