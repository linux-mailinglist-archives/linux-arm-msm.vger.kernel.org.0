Return-Path: <linux-arm-msm+bounces-100595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFMnEY79yGmUtAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:23:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 506943518CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 637DB3006037
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECF21F03D9;
	Sun, 29 Mar 2026 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4ajmDHD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPHrhe6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241F12E11DC
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774779785; cv=none; b=g7JFkLoUHEkznskZtZFHXsvY80L8FYMYzkeOUADHPJZPAQUl4bzVt3je10B9ySZaGOYyoJOPRjrVzmjZx6+LgEr/t4wzR88fBZDVbBabfi4aUzUfn+8ygIdQk8GI5DEGxBms1sLA9D3tSkB3wDyRBAYc8Y5VV+Tlp9vq2Vh2QH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774779785; c=relaxed/simple;
	bh=1B3p8t7p+sNp6smp5yfHHFK4FfmnNnwgd+F2bvVNRZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfR4yNlprhK/FCmkcdxMyNXG2hFhmPRMXHjdFDR0i0IoihYciNTF8e6XNTZnxf6v/N8grLsR1hrKKVATfraeRdFpSdL+WDQLxlPqW/qg4Iyoqb3FTvedn8xfAOE6YfUQpuBI1W0OoDf31e15n3zGj2nVnPrlnNjcMc+uThy75H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4ajmDHD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPHrhe6W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T11lHs3902135
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WjruFqvQGpvNJCs904A4Sfzy
	trtbC/kUoihmkvmtPGA=; b=i4ajmDHDD29DW+HQ9EDQh9hR+QKxlVE/8KJZTGCE
	BqBmPNmVDQq+C7AO5VQPVyR/CPz7ZwcflmOiNG4FxcJ4vk7z2/HVIwv3AXQRz5IQ
	Ps8e501kdwnoSDoCyWa8ACmMBt6OIJqdFN/wYBI1uPyrT+5Fc2UfKOefynrKkMP/
	wu7zrnvkmDjan1HwQksw6013YU5PqlX3aogKVy4OPHdExDgPzH7dB1THiGBC0apc
	1p9H/Ev+CCYO8Ews0nbysMwnsNeOMYnZfK3AxHiUzY32/0cIFU3k3Hm040udX0py
	SKqVPtUL/6BFrrcNfigF4hb0UYc1n5gm5GCjzv/KgdXTzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685haf9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:23:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so91971851cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774779782; x=1775384582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WjruFqvQGpvNJCs904A4SfzytrtbC/kUoihmkvmtPGA=;
        b=YPHrhe6Wfi7J8YjfFqIX++lfNTCgD5sYC0DWIEoPsi8GaAvPPwXfHeadEZ9U+0Zmjr
         IMGGLZ+MksNKWYIOBsY4B1+/RN3hmzCgIVR9FdtImiFyHQ3b0uAxuXKpRq/cLHkccaGU
         mxhnYbNljFeV2QDKgoV6nuGpQ+pbDzm7a7bNeClQVWBWQY2y7kJ+VAsyDWphprMsv8Ac
         6bz8SXEcJmJBdmMS78K7aIVMFsU3bqarp+bILeE4ZRtUNiaP09F8dPl+foEqUmtPLIso
         A323K5owkAq9Id6tXcyynYgVvTVAKI8pHpDuzStQeblN8FApO4ykNkSJ5r/CpqkadwoK
         Ic5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774779782; x=1775384582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjruFqvQGpvNJCs904A4SfzytrtbC/kUoihmkvmtPGA=;
        b=ZZfPxlvBPnBqdhoSsD9vKDSeJ24CLi1AryGXXgzwvy2utAVKnPStZqAKA8ZuFaMnVP
         z8T46yEAhSFcK9jWfmHvwC/JvjsNZNGqZbFMQcgIYQp9GxCmlM1JPesZBV38ka+KvuOU
         uJgXxvMFzZAzjOmn5Re0ROrQiLzVESVVcVNPVQk+c+N0fX7RqOjQ/Hi6q+tJH2gh8DgQ
         v4vOLW7Effh5E6FGKA6B7PKPo3tZcEa9P224bmhRyjxM8BejjdzwhAvchHRKLysVV6a0
         rI4FwFsFfg7PLd9qSsq2yEvrjIRFVYU0CTZnuNYkI68HRKW/OJ/lrHOT4+H2vQYW1G+b
         8oIA==
X-Forwarded-Encrypted: i=1; AJvYcCU8rEAFGu3tWxSOrGSR2sfj66PbMK0arSUcmPKdqzvOJ5bhmtsiT5IG+pKU19Z0mSJXDP2XFgVgTftAI+sg@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7e7+9aYyz9scP6c7gt5yGqMOsFtwpvusm23VsL9Oi/KTg4eA
	rp4aoXUUwpzq7AkYp2tddK1TWxlkUUjtpiQXAbehzzZkm37JSrRM3oFQx6JoFG7KYatTGp1hJAJ
	M03ahCvTCyCRcVl/cJcGUonSQhVNbUNp8uKhUi80hki99Fd2cMIe5234pSPNwz7yzSoGc
X-Gm-Gg: ATEYQzxlIA1d9WeE1Y2OvXjZ/BXUclF7ZfvNiKxA2iLlF2pMU6yUaKI59j89SSHqACn
	0y2iTdtQ65d3rnet13gcOFiG5TIFb3UXdPpDSNkqP2BsZ9aWKsIlXY2bmYPXxWytlQ7FYkC2lgU
	Ph21A/YK4lxCoFaxkZ4JndTt6laGPFDvOlwybk7mnoSwzvj9+nTkiMCUkB0cJm6wj95jBYOEl9K
	UXwzSfwbldQuoc8GtGcD+tcRHp/zxMiYLEqO62D6Qvb1uKyoG9lijIRvkNknDg9nRk+o1gRaaAn
	40ZjNn29iS4GYMcKKwqLln587GPTx3ELzQVmK90RXbgVPYYlw7yaFMnM8eazQxHgUmEHQi7hFV9
	zJhwTdcuq05saI5rojNdpga+UmQXTSZ4ir4VGeW2v8ZRNmDkaG6pBWnfrTGIeyJCTAb/u66ScpB
	c5yfL4ZsZaDcBHi0AYYObIfm7Q+Ab0Xu5hEck=
X-Received: by 2002:a05:622a:1805:b0:50b:436d:dcc1 with SMTP id d75a77b69052e-50ba38320cdmr117928921cf.26.1774779782366;
        Sun, 29 Mar 2026 03:23:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1805:b0:50b:436d:dcc1 with SMTP id d75a77b69052e-50ba38320cdmr117928791cf.26.1774779781947;
        Sun, 29 Mar 2026 03:23:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83903e44sm7941931fa.40.2026.03.29.03.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:23:00 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:22:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: fix remaining gpu_zap_shader labels
Message-ID: <eulkgepkilthpnmavdyt7vyd4xbyieuilxnhczxplrarkf36dv@4mrclcnlpxdd>
References: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
 <20260328-zap-v1-1-f6810b9b4930@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-zap-v1-1-f6810b9b4930@canonical.com>
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69c8fd87 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=DfNHnWVPAAAA:8
 a=EUspDBNiAAAA:8 a=vnj7qRFnXMJaR1x2dbIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MCBTYWx0ZWRfX77PZzmYpyTow
 Ncdv5u62FTdThrZ8DuUOGrjreV8BplpO0NtiYqwIICDdAZr/8p8PkfKVK3Aow31LmYGRP7DA0LK
 Y4RcvZ41dIdQaUaU0Rg/hsFY5nikJKez2cnoVqnXD50aJKW9qJ2PQ6JG7fNaK8q8n2tXwM23qlO
 m+oqpYODNievhHLQAqx0TzEERB1WLoPCdC9jbMepoUmhSzOYWABMfbBaseOxx3gYxt1RZlxJEL3
 YOhJGnrNPeAqQNT5dVvnwjnxS1aDjNPO1ohLQAwMIiQTsYbPOwo6m/y8kZ/Z5meZePigXuz/7Eh
 W+vovi+/jzSQZQNbl9mx12NC6Af2mptDBYkSOtZ0Wo6CFxNlQ7LVzY/EgmO2VdU5iKD9Vft3QzG
 qbNWOUMNj8QaMIDeJwaKIAL0cElR4vuHW6uovwXjGwFoyidW7LID0QNv48UhKO8SW1F5V4kJi6a
 YmhaUGIOQQqI+or7qPQ==
X-Proofpoint-ORIG-GUID: 3qNME1juUr7tIpU6wilCw-31LtY13NkP
X-Proofpoint-GUID: 3qNME1juUr7tIpU6wilCw-31LtY13NkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290080
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
	TAGGED_FROM(0.00)[bounces-100595-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 506943518CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 04:49:21PM +0100, Tobias Heider wrote:
> Most qcom DTs were converted to use the gpu_zap_shader label instead
> of patching the gpu node in commit 2377626fd216 ("arm64: dts: qcom:
> add gpu_zap_shader label"). This fixes the remaining ones.
> 
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi           | 8 ++++----
>  arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

