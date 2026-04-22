Return-Path: <linux-arm-msm+bounces-104073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHNPAYao6GnEOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:52:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F15444FE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13A733015E30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65AB34DCEB;
	Wed, 22 Apr 2026 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnmztYFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcWOlazs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644B4372EC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854977; cv=none; b=HiJJ7BfDljyZERi5hhuNjgWSCzWyN82xM0AQ8a+ZIyDB0YrcB7VABOb0S1JkmA+eJq3FuxqvFA2pLIVJrrJfxv4qfljQHxSbHyMhtxIZk6LKKWnHuefEzf9LMbmNaLKmAe0IYUoTsG3QcGVDLxXIv9XqodGRyZbESAxwk/iAu9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854977; c=relaxed/simple;
	bh=zmbqoX3kNwu8LQZmFUUYGM2iqI3PjfKYE6+EnsCnmnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a0AmqLwwfmGzbyxrS0j0EM86bE+aN9C3S5GnU7ywrmr0ZVc4GwwT6Q9TZPox29aTYkRb4lqf7z+cnLBJj3bBvfI7s5A4PAS8PI/4b6EsvTUd0pZRXUV68PlGgTtZjNJwL+utAwCEoG1rhiH1rgqauU7OifzNIF9QIu4hipeBM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnmztYFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcWOlazs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M98nTU646724
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fv3D1n/oPjVJoiloVo7navaxX1Q7eAnio4wN6tOyasQ=; b=DnmztYFZeE2tl2TQ
	ZNkidJQfA1l61uGWKxTxYiYqGZt6upe1gmhp9ugIDoz4gnqZkRt/c73XhMTYQuwg
	hwBgzVUAJW3FzFTdLGrUDSgrDvJliYcR5EAytNInePlhHVnsxvYCR8ozGuMsXSn+
	y8UElz90YSBc02LwC0SsjXnzXnIhJqDAOP5YJM8a6RazKrOkA7a0iu47tIQEH/mD
	rLqa5mPx+sGnZPAcpHXV5yHQa7jpp8RjMz5Cc0rPeDrn6+Z7cDsXrmJZebwloggK
	16F9M339HBWW5EAL/rHrfGvA0UuLnO4PbkkEaHz2xLxsRsafUSy5Oe22ciC98w05
	5uaQjw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkay2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:49:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-610b3dc3fe8so225272137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776854974; x=1777459774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fv3D1n/oPjVJoiloVo7navaxX1Q7eAnio4wN6tOyasQ=;
        b=ZcWOlazsJHhNWt10h6VOOJASQmP6Jh1oj66ZZsjGtwovD3+XjOqqWn99NrDrfANa1G
         aD9hwke0H5eg2FvYk88rnprU5m7k5lLcApBqUfZET9ULJKfxPsgMOGAW/DTz5ia1oyam
         IAiOMwKVDCtpR1I4s9LM9Dgf8wcrnpGwLR9pXd6R3FJ88UUi/pQAL0Al771CFs+LQSHp
         V+dDQBTfdQj7tRUa07MMmTyEkoYI9K3s/xXbP63hU+AfrcbbMO3jFa2eKR0RCL2q92qr
         woOZCVCSmkN6donovAQcNwmAjiTAyzF/8IwKuKMoB0IMoihb6cKU9n2qmb6tYQdAI6S1
         w27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854974; x=1777459774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fv3D1n/oPjVJoiloVo7navaxX1Q7eAnio4wN6tOyasQ=;
        b=U4utEOj6rxMGnokxRwcIOOpS92uxiAbQvEz1pTx5sa9V+VtoSGnqtNSrndv46kYjG/
         fz28gJeONfkS2UWOf3gGLa+Ldg7JTcAcNZnLspJvlgKqpidMbhIwmqavw4SDdoSX+Uf8
         ktjJF1WKe/N3ZrtCILn7QUusLGu32dsIQFCxlONmBzzGxA7WSoFH9MAyZqOWAiACCzR8
         U/O+hYs8T8Ila09hiXrNSNUjrB2qxqMXVTGNMXgkvGTiwt20WBHqC3RKcCPzfF+VF4fj
         /BWMriyAnPUtOR0rEJum/mZrDiiS1yrcB0ZvDFWs241ssComeqLZTm2S5xTq1KqWvKxx
         YcaQ==
X-Gm-Message-State: AOJu0YyWwKoAyp01CLW08kiyhGO2+dQjTKMakvTL0ArbmJw/M0T3laya
	gj3kYi+xJsUdgya2pSVNYHqckejP3gRSEAxl347bV6rZeCWwjSjbZXuhk/bfL9HsIGAEctB167T
	VZl4/3uLQcEQfemFB87Rk5dJ+vGzrMB16ffodmjBkGJxVcyrFADZ5FcdUl39T0bQ1GDtq
X-Gm-Gg: AeBDietck2SoEeWgB2eNpJ3mqM06GEjKhB435EWEX0bJl00L3uejA4bXLC9v3k7Pu64
	gK/HdYfIMWNdRu60UsSVqURwZi0yfxFRURzKrZj+HUc87Ej0ezrit5Gj2t1dyGkI7nhIw+dudSx
	dbGnC/RnzSO1iVoqkqUZU5vFJ7ykMKdZ0kq4cilG8AE7VeQAIeQ14fGQ8YTUteyvVk/Cg5RKTz6
	SB3dPUiLpru1vVbel/LsQRLg7fTcMdo1h2Ddj1I+KpeOjwPYlAuzWCIMq9USJyHbRpCJ7UpetqH
	8d908Pm+ZlEcvhiqDVsl1jm+D/oWI9WOAZNFgw4rILHMXVQ3b2/lZDCr3k0bCBr7cyb5jlSfaqL
	NACoqeUe/5+uwVoGIQFN7VA4j3OM3cwlStLrIEHmMUWL4/ixx7HipZza/K3CGNbNsI9ABMQMw9N
	RxDCvbrSQO5VA2kw==
X-Received: by 2002:a05:6102:318c:b0:605:5eec:cf0 with SMTP id ada2fe7eead31-616f69da620mr3079889137.4.1776854974612;
        Wed, 22 Apr 2026 03:49:34 -0700 (PDT)
X-Received: by 2002:a05:6102:318c:b0:605:5eec:cf0 with SMTP id ada2fe7eead31-616f69da620mr3079879137.4.1776854974128;
        Wed, 22 Apr 2026 03:49:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b7bsm36817921fa.23.2026.04.22.03.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:49:33 -0700 (PDT)
Message-ID: <82a32de4-82c9-4494-838d-48900dca49ad@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:49:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pqfaCFwERbniGEsTaMREoVkhugK3TMXU
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e8a7bf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xz9duOo6BVSrPpx9aFAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: pqfaCFwERbniGEsTaMREoVkhugK3TMXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMyBTYWx0ZWRfX/j+36xzDAAAe
 +RXMPWpS4dVxd+8Qu5pZDx6zivg5LAhAwH5WN7/pIXcwHBSxD3pDfEdVOmFKyBTgksGTxANEwHz
 uDGItW5fg5zB8qwrR90v2fsqbl8CR/tMExr4jlZ/+dXCdyubyjOn6B84uECwHTkSYGPl/QqHZxv
 Tn6H3lR5ZFK9uRAsGGQs988UfdMxruSylGXr/yr74fw6KTMnOHLfwr15RQ2iQhX2vzo2BjES4SY
 5YQM7pl3JlOqawdf1VWm9yQ1o0H3GrKtksykKci0bNp0VPPSd1SZoggu9qNn01cK3BVxuC1LwLx
 HsC5h+SCK+7JQ1yHDSMX7x9G6i/C0oGnagv88G1IL0wRydZMi7HsF5meBEXTvekWc0eGPUR6qZe
 TjTt79meYYT1pyMNwcSOcWIdKED0AlPGtTHuGU1I9z+NGCOBVNcORKoaqUVPrJElK5dE6EvjrZl
 mKeJcR0x2UMKQXkanFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104073-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51F15444FE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 12:00 PM, Mahadevan P wrote:
> Add the mode-switch property to the QMP combo PHY so that mode-switch
> events are routed to it, allowing the PHY to enter DisplayPort Alternate
> Mode. Expand the DP data-lanes assignment from two to four lanes to make
> use of the full link bandwidth available in this configuration.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index e393ccf1884a..0c180e49816f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -789,7 +789,7 @@ &mdss_dp {
>  };
>  
>  &mdss_dp_out {
> -	data-lanes = <0 1>;
> +	data-lanes = <0 1 2 3>;
>  	remote-endpoint = <&usb_dp_qmpphy_dp_in>;

There was an issue with this on a similar kodiak-iot board:

https://lore.kernel.org/linux-arm-msm/zjmf27y5i6ypba3nvsxxceuxn6yogp46lmtrjua37qa4ibrleq@4qv5s2wirgdh/

Have you confirmed (through debugfs) that 4 lanes are in use when
running this on r3g2?


>  };
>  
> @@ -1391,6 +1391,7 @@ &usb_1_qmpphy {
>  	vdda-phy-supply = <&vreg_l6b_1p2>;
>  	vdda-pll-supply = <&vreg_l1b_0p912>;
>  
> +	mode-switch;

This should be moved to kodiak.dtsi

Konrad

