Return-Path: <linux-arm-msm+bounces-97313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ih/BB6ps2k7ZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:05:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4C127D8D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1CA57302565D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 06:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBCF3358B6;
	Fri, 13 Mar 2026 06:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJfMvUBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeU7AxGn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE432A3DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773381912; cv=none; b=OYBF/yzcMAwOjmDUF+yBH1cYNGM9ue5pAfJGEOgtEmZ9XtU9UbHBl3EQXGZtHbpk2S0/ua2H37Iuoh2uDFpBd2JENUEIjApSKzX5oYmoRZ7fp0AMalvTl7IjKi51qQTwBS57F+0rqvzLs3X/SPahwEGwTktGmm9KkivHx6cmEZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773381912; c=relaxed/simple;
	bh=JB/usJN3+rbRiZIr1+8g7VPqy6EEuWzOH+oPf8czcUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJCDw/dfBLF8hlsKPAiiRtH0e8W35KdX3vffiWnZc578cOiUCX0yx54jlTxCRE80h/Pe7WFoS8XC5jXX5JLdMdGgoGcrDe0H8AA+f1u3xYCkewgpLk+HCQEiR/QTpoPTHzKkBn6JjNo+e7Xt1epkEQqPTiSK19Qo1/V27LBvkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJfMvUBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeU7AxGn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tjM41015006
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zeM7gmRvWE3zPnFK+DBIUx8d
	4QuC9ACWMKfdIK3rw1I=; b=QJfMvUBqwcfY9u+taSrVQqTd80hEJj12tOwH5Q9j
	xaX9k0s8mlDbhIGsyeV7Sv2muOCdElzAqOAi1FkgvuzsypAnc9KVBF/OhZbRfuI0
	eP3/swrWAVVyoStb5e+YPt30JEOc7NG6psZJycX4CZ0mekZSKIfbVV2E1p5/Ff1p
	UXQnYl2ePnKSwUKn85QTF0fvIYjitY+MK2kohDZ7/b+AXxSNk2IYy0TqJGFJTwzA
	PuKJfdmvTc5N2rmnW1mvZXsxdjvfMVtx5kAOry1BM8k/Jy/nrsUlXLxe3dy8zJDP
	OluuQkZYpex1FDmbDCQwjYuzgihFZk+Hwmeljq/GFawn8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdm33c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:05:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso19613735ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773381909; x=1773986709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zeM7gmRvWE3zPnFK+DBIUx8d4QuC9ACWMKfdIK3rw1I=;
        b=NeU7AxGndEWvTlbIu+rGi8hAXScOCSM6lVidJHAf13QLWJiRjRarEiJ52OV9FC/t8C
         fw8mLzlNM/ajeNlgNdYitWZz6nLZTpS8Akt+wZUQZUzVwifVlqA7iEoFDh0ONpzxQP1u
         JNc4Uof5ODbUj4b6n0+4EbzXOpsTvHY3ehpXP4K1cJAZB9ve2beajZaTXV1U3tpIDol/
         z5gbpbfw+0rkTrySn9fFXj8IP1aJNhMO0gleUgl5QgLIKcbsrxLWnsqtL6vtRslIxwa2
         R89ifkNclMVrDwDHtH6aqmOb7Vx/t5FO2VWzs+ATUBBeV3ke3Mu+0/XvtvZhOI7m0io/
         C9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773381909; x=1773986709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeM7gmRvWE3zPnFK+DBIUx8d4QuC9ACWMKfdIK3rw1I=;
        b=ohUFbRd2H+ZhTgbT2nbTpUMulC02UL3yrfj0gUU45R3q9SxaYBwEJlGM7ry8aJ5aMz
         bn6DS/Vvf2lZ3ljbqzouju1jlxiTflGEktpN6NXI7sVX0Q+ADB1KA5cJqkFBaBBkbb7f
         bCG2vaC4t7IFFPZvDj4ZxkMXaSwlYFNSIIDX9uRD7hdDNtU+rORkficAzJFPIQQbC19b
         oBh49XljxGfeFn5YP4KJrjbAhrqT5IABcybg5hySmhhP8BP2592+EfVrDnY0khtQDy9w
         c5DsxsCXF5bqjuFvM2XoFZDNUVRAmTYXPBKy65tdn85TMALBuetApGnUdk6uvU7Lg198
         Unzg==
X-Gm-Message-State: AOJu0Yyd1jy0IQG/lSY5CfSX0RU2rEdDNPr2e39U1ILmnKBXkSSNkhD/
	0QwI4zAnaNHkC/LTvAR6e0uJdaWYPB6YoUfqkSVslwZs8IhpWcKcNCZ4IisZx48aQZG3myR8CsH
	QcyVEm1nibWrfXHfLgvEoeWZaeepImN38LxdxTib81g91X22fS8Cd8VpYr5ypJ+FUSNCV
X-Gm-Gg: ATEYQzzdZuCuD1Ra+vsU+K7HZIm+O7F2Rhctz00Z/UPHkDstK2aZbzIlT3FzcvySiO9
	fg56XtEE17haabzbaYqIbWavpyiCvuvQPEfauZC5FgIAb8JfnMKzpnmysbUYX9D/OgTVbDoOPuJ
	L8d/XH+0/EPZKl2d2JMrj4J44I/hDTZNB3XyQ8+Nbx4xn5nqFlHdQImcjbf1nDVGHV3EMlZWccR
	PD3Z+u7VhNb+DVmNDfR0HWypA3hsnPIXKd53z8CP2x1h21/vQkfUEHCtWtqUjXP+oyEsuO8MS7t
	mlS0s/poXfOqbxfB7HcigUeG8GPGEozt5dtjK5crq7JQMZpAQJqdBh5vYxv8/Kkb/DcI39n/7k/
	rXgLOG5Pkdjy/yHJiL02yHGATplLc3JE41MtDa3kN0EwGXO5W
X-Received: by 2002:a17:902:e80c:b0:2ae:a786:6663 with SMTP id d9443c01a7336-2aecab1e86cmr19453575ad.26.1773381908519;
        Thu, 12 Mar 2026 23:05:08 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:2ae:a786:6663 with SMTP id d9443c01a7336-2aecab1e86cmr19452995ad.26.1773381907930;
        Thu, 12 Mar 2026 23:05:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee5b1sm10183605ad.46.2026.03.12.23.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:05:07 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:34:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/15] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260313060451.hswg6snnnexchmzs@hu-mojha-hyd.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-2-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312062756.694390-2-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0NyBTYWx0ZWRfXzb+lpkX34riv
 n+I77wYuG7LfdyYZSFw/19wMK6nUlHEypj+TsdAlrI+kXI8oFqL3KMC1NK3q42lq0nWsWaTWt4s
 NISi58ySkX9OWMFglt/o7HRdzKGUm2+GmtnUE9YhxcrcsIV26kbzaC7jzjaDxsO5a8U0GZRQrU+
 aJ0wSnSttLBe7XNJ0k4BlwSgPOlxNlxceFAlaKq+fcRzuf2lwiQHMKTpvORV0Th9eo4qUVQDTmX
 Fhu17a+GC7ypx1tkKTuMxxYe0Cy2Kqus58x7jvTz1lgdRVfFK+OTinLMZdrKB9LnrvjSsFJF6Za
 LmtbtZLnYOJ8bjfX6DKBxVH4WLIdH606IoCM8y5ecsNzLOtGpVCQ2ptzLnEiTYa7Yhme4dvapl0
 LqSpVhODBvY8/PR875233yKEMpnKhHWfg8wL9x92K2Y9zS7PGA6STvvrGxNrBOzQgj/aZ3Bu8lt
 km6RsW8gQVMlW16IiHA==
X-Proofpoint-GUID: kFlXyvggxjTJlwKF3xpeIr37xhCE4hbU
X-Proofpoint-ORIG-GUID: kFlXyvggxjTJlwKF3xpeIr37xhCE4hbU
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b3a915 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=D5leSQ3MSkE6s3ds0kQA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130047
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-97313-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E4C127D8D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 11:57:42AM +0530, Sumit Garg wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> All the existing variants Kodiak boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU
> streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> managed by the consumer of this DeviceTree. Therefore, describe the
> firmware streams for each remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> [SG: watchdog fixup]
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  2 ++
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 35 ++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..09a7f943190e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -139,6 +139,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb

We may need to add for couple of more variants..

>  
>  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>  qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..0b3a69a0d765
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Kodiak specific modifications required to boot in EL2.
> + */
> +
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +	status = "disabled";
> +};
> +
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_wpss {
> +	iommus = <&apps_smmu 0x1c03 0x1>,
> +		 <&apps_smmu 0x1c83 0x1>;
> +};
> +
> +&venus {
> +	status = "disabled";
> +};
> +
> +&watchdog {
> +	status = "okay";
> +};


rb3gen2 has modem as well, did we test that as well ?

-- 
-Mukesh Ojha

