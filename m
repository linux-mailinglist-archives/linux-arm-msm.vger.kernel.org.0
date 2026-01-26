Return-Path: <linux-arm-msm+bounces-90564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH4FCXxud2mMgAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:39:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478B88F4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8970A306147B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D1531195A;
	Mon, 26 Jan 2026 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbDFLtp0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2iqyD4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70633321DE
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434421; cv=none; b=bbQtO6qhlbE1Kb8oJrJQO56xge52p8TQ12Ci1dzfAXLhUwgeZAiLyQyvRw8sv6uVWKbhwYGwjNBV7enlw0JBJNaqLhKi64aKIFV2pdQ+TKr4MlyUOPhJIoi402cM8uHCy4e0AI/Dupaqh9P3c5MGyjTbSRrywWu20WYIWGSBmUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434421; c=relaxed/simple;
	bh=Ek0lCnCJwsf2F1AX19ArDWXdm66DnHRHDg/0GLFvI6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+nMC7ENTeEEuXOA7leN5XfhdxLTgSqvjaHypQ2mvdCSmyzkoN8eL173MmUit4XvWraSOJyqaQdg4Vef5Ee1lauxTTQKZ8pYO3l3PiG/KR6QWsdO4vB4YxIVuOyS+XHS5XmkaUEG7d0BXAeTpo1CBvjBJC4pTLWHYiuH3pmw560=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbDFLtp0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2iqyD4S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5UvKN1020378
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mwZj9Z+9l4jOxcaIYwel+p8a
	o48f/ky9KmTuOH0r8i4=; b=VbDFLtp0KHOZWJsaTb/Y8Xm1HafZiNK/V0Mn9nU4
	gSLE6QSLV/CPv4IKH/N42G7UQnBmQv3vMP4d2S3nuTJxOjMB5jI5nMRY+rSsoqMn
	PZWpVzz0+226hcZcm7UolsGIufMhyiJGQHylJLZ1G3IKSczfrne20MNBSo+28FmB
	GXyX8VWJICv4Y3zPJkSHqUQ4hvxWm3hbXDrxcWQB/WxpywaDub/jV/XK3k04kWO2
	O9ebMQL0tsJpKHGQGGJgnwRE8XIfY1Nhtkk9HbY8Vh5cPjSHYEtBJ7FTNzuWzKcT
	dRWLvXfsCvMP8g5K+1bW00tMxWa3/bIBJ+pyO+y+U3ZUag==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx26814qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:33:40 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f57cdeb11so6896695241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 05:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769434419; x=1770039219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mwZj9Z+9l4jOxcaIYwel+p8ao48f/ky9KmTuOH0r8i4=;
        b=L2iqyD4SjiKJHAbr3XdcqZzNODtD2ppXXi7EK1aXDwibNAkHO9HARv0CSUBKQby163
         E3ZDPOlJYfp7sMDj0RU9BmHHQzkV4nxm5b2MnS1prLI+b9bRKaIsOZewKb7y/z6PwqK0
         8QL3N1WKWcp0HPj3W4JaxFBmT+Rc8osa0bhTUeQxzu9FvrnB6u3lb9M+iiCDmzXsWgXE
         uAkROuI0FyOnFWHCh1hOqtErEFDTumFSTTaO0ijzM44oxUTov+nCxNLzeM9fYAuojE0J
         i/+VZb67F7kJoPmkZ5gvj2nObIpLEFT8cc8QtwbCiWnVghMnd9TJZOnmX5gReny9pYsz
         xv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769434419; x=1770039219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwZj9Z+9l4jOxcaIYwel+p8ao48f/ky9KmTuOH0r8i4=;
        b=quylYzVV9ogo8pTCrtV7ZrCmPRM7w+00atmzPwdlN+V9nVYevv61d2C1N7WhM91uRI
         05ILDXoNmyis/ltfPN++0SRYQ2SxceMgRuhzIu8SNpcav+hPOr7keuGngOVqf47AejGm
         FriccL3TlgrvlWNNJgRJwoXaBTci9kcufv8Kr2qtmyIzVAWlZHE+YfprLxWUg7ufFa8/
         GdvjCFDWYEMRLk8s/RjQTZCeUs8zj6ZFUuW4De8N+4V/CbNNlwkg7AirPRH//iM93EKH
         8KMI2ScpFTIt7XVKjnIl7yw2cz7Kdc+SCIBm6ij0cigEnl68j7QUox7A6sQsFFrcnsvS
         2e1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9pLZVLnxuPV6V074VpqAN+p6ihKsG69y1mhxfwxA+a370QTjB+trc4p4gfnXhwmfT8UpN8CnI7fdqxp8F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9jR4fG6veyA/NRbiGl59xv1TzHbI3FO0G/dm9uwFbYXoPk2st
	WUeojuJKywtJXIBgGhEGWtZqWBlTsHvBCz3lpp5U+2HGljEJTKZ2lJKBEHFOGbesGvEBFV4oB1/
	t+9TiyX78/Rpq6CHq+llxT4MqjbVoDxNxCCcQJg2iVwPZ5+fw9v5PTI8+zALW6GjInyy4DrFu8A
	P/
X-Gm-Gg: AZuq6aLzjXPxG8Ax+HxnItMzqs+JFTRA71KcIS/kyK1FOyi5RY6OGgXsIgvvuTIbz+H
	dFIzV/7cSLV2U8+UgLP4LCGoV5ADOlOn2/vMor/QCs9IH7d7J9eWqfE9x5uGydTsjt7chVHUQSu
	LgbkHcykKZGnVddkfQ/SCRE05OTwagEQwcI+PU2XLD/Xk4Ekhf3fKYPnkggkUrAllD3SSNSrxuD
	5HllBEiXsIcLk3029l0jZ3soFTX8CN+3WckDt4lEhNlbg3TfdmVxbuZ37y1mCS2LNBkBoUlaDHH
	BXUaJuTS7yO9JYrym6WHHanDtj82iA1y0aB5QnxVIRqLiq/r/4Hy/z53I+kz9/gInrdk1cnV3CF
	lMfn2ZOibbfqUbwuaMQ4YREzlw4gy+pVeR2ybW/kgonHVylBEmn1sBrUsjg5FAn2nnca3pmTxft
	xl8yOj5VZc+8VU9E9fuPoWEdc=
X-Received: by 2002:a05:6102:3752:b0:5ed:675:e355 with SMTP id ada2fe7eead31-5f5764b036dmr1049643137.27.1769434418589;
        Mon, 26 Jan 2026 05:33:38 -0800 (PST)
X-Received: by 2002:a05:6102:3752:b0:5ed:675:e355 with SMTP id ada2fe7eead31-5f5764b036dmr1049627137.27.1769434418109;
        Mon, 26 Jan 2026 05:33:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48df6c7sm2724433e87.16.2026.01.26.05.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:33:37 -0800 (PST)
Date: Mon, 26 Jan 2026 15:33:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add missing clock-names to GCC
Message-ID: <tw2lcfppz6lrmnpcfm5yh5j6iln5amedo2fxbyapx5ralclhjl@tyiretqzszcm>
References: <20260126-topic-talos_dt_warn-v1-1-c452afc647ad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-topic-talos_dt_warn-v1-1-c452afc647ad@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69776d34 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3eHDywHgAMhqHhNdZ5MA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDExNCBTYWx0ZWRfX+5qn2fXKYgry
 JBkvQtbe55g6soLwvxxfMly/XdmQGKlwZRDhWImES6RJt0PwdYZt1IfS9wYx+YiCIkTFwVDgn0O
 mmjwq9xoktwPr+Ih8CiEBlCp37m/JtYlbT04mS6UbugON5uMhC45QY0r4Bna+YU8hstrzdMgB1O
 Vu/kEHsPekirlgxsDEkmjItDwSAYZ9zsTr9YO69X7i3dzLOqyuQ9Z+pn2HvkcXEkxMEmpOfnMJ9
 qVGImGKf3DqqGkeJOxZym/KNK8+Q63cmHSwF2WF5KQqZXazGfQAg8qR9KnW4DYIL1Iz6Jzq9Z9p
 jiHWwCyA7NJcgsGVjzb+LvgQesLdCcreHJhhEZLgRWx0DyQ7klJq1eMQlKs6nKkM+qSr9rZPe6H
 hqonKFQvdcAG/Bzq223mGcFCzlbyBKw5wO1iC+eFwpoGo7KNOUhbPAHsBG3Aqo+RTQ4ubCqDPE8
 XNdLA/KycExV8NwE5Dw==
X-Proofpoint-ORIG-GUID: 72svVZgH6QvUezh2VRtJrc4FNpvtXb1m
X-Proofpoint-GUID: 72svVZgH6QvUezh2VRtJrc4FNpvtXb1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90564-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7478B88F4F
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 10:45:03AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The binding for this clock controller requires that clock-names are
> present. They're not really used by the kernel driver, but they're
> marked as required, so someone might have assumed it's done on purpose
> (where in reality we try to stay away from that since index-based
> references are faster, take up less space and are already widely used)
> and referenced it in drivers for another OS.
> 
> Hence, do the least painful thing and add the missing entries.

One (me included) would assume that the presense of clock-names imples
that the clocks are fetched according to those names and become very
surprised if they are not. As such I'd suggest fixing the bindings instead.

> 
> Fixes: 8e266654a2fe ("arm64: dts: qcom: add QCS615 platform")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

-- 
With best wishes
Dmitry

