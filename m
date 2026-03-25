Return-Path: <linux-arm-msm+bounces-99796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKN1AlKEw2kPrQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 07:44:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D15320498
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 07:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A0EA3077132
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C4535838E;
	Wed, 25 Mar 2026 06:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1RK9Ry/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMcu2yjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DFF35AC28
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 06:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420829; cv=none; b=j1WBM4hphzNUh7eAREe8XA5SXVWRp7sr6UWMS3ZzTCYRnCJOOZxWab/zZCihQg6ef7N/yxo2XHbjKR3VHfHoS+R7HbyJ9i0rv9v6y+Yco3oLIhczJ3HLL9UUTSLilsACTfE7G/J9vl2EuyljrC0phqWlBmDxbjI29nhufX0C+5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420829; c=relaxed/simple;
	bh=ZHoopXar0siBkmA0gR71OcKMfxqsxGEaqo14KZd5qGQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tlMXbNoFMW5ygvDBexHIcpZb+5mDzBAvEOYFQ2lYx8cNomAv4LrjgrtTBp6X1heqBFaYg8pPavl3iDCxAxtUZuFk+tXwLnh/RKLLpFfiNhEgmOdU1kP8LCNouPpVlTAxhUn4z+W5QQO9pZMYxj5bHx4gMVhclRn36RvdXHI+GzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1RK9Ry/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMcu2yjW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4sC5p2973641
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 06:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXnTIakBJkyc+2R6oButNsRNGUqNe2dpEeXBojdHfNQ=; b=R1RK9Ry/mdJGpqGv
	l5zWjxZibnvDaauW8kv7SjVdD+EJi46sh47s+558S0QfgKEz3cqSFWdtfpdoGm7C
	DrPWZg+Xvru91kYgHCgvgxTg8qBgV8hlTyM6X2IdLqRklGmO388WVEKwmQVJHR4v
	nuVU+RedtKeuehFkst8q0rRRLdU7gD3asCANL+gWtesEm6tw5qeUlr/6eK/Hhx48
	9Mtpbi/u65qaBoucMl32TQQZqV9sVf/CoWaMQ6Z7OEZyCZ/qGTfe0qBRA6DjYQRO
	lHi+/tWoqis+lXJVu1ZRSpNfrkdZDoL6sKUWn006O6FRW+eX1fVKDv9QoFl8PJss
	KPFTtw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4hueb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 06:40:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aae3e185a3so36728915ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774420825; x=1775025625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MXnTIakBJkyc+2R6oButNsRNGUqNe2dpEeXBojdHfNQ=;
        b=FMcu2yjWwEtQC/dlsxdS1LQ16kPWlkb4Coqkh72KIyX00d0Yo3cVRq8LVVqrVN6NBx
         UKsdjsKyuKlJ95iZzNSReXR0ZX4JxwV7BBq8R7EW735jSdNZepayKY3tNldDo6HNf5lj
         UoxB80b/LIvKz4IH+89g8kp3F1cRCV4phRMGYBsFNcjLB1JEVx9z8LPFZtlfSrVknQoE
         7XeXmY8VzONo0aXy6eGT9qqL9ZSOQbzNg9DSl0UAyYwRFPsquujTsZrYwfOfRDcVbCM6
         Nt6Re4mOTjE3kLskgzhvMBMPd2InNOGKZl5K0ll7OdWqF0xTDUwSPxSr5l+aBPmUjmCs
         EkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420825; x=1775025625;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXnTIakBJkyc+2R6oButNsRNGUqNe2dpEeXBojdHfNQ=;
        b=Y1c/GR4RCR88qLJe15e4o+KpTw+IIVDH03UPl0/In1GgwjCCzeXzKQRoFe10EX90cJ
         ZxUyTQuPmB9Yt7VuGm+leeKZ++aG1kGg2t7VQ33vs2SXI2MIvR0WZ7RQ5zdjHv8EEIgU
         m6fSJOhIs7ZxtDk5/FVxHW1IJ7oEYzevlL9KcpmWHRg3z5timO41LUz9aJ8xWvT7vHGq
         1/H0eafZ8jlbxnGlhUuIuDSRBHvZhVevj6TMhFXyL7UuTXuGopQw2iQMuF+m6BTLbmpJ
         QvP5kr63ZDKZ+rytMZODYjKRKYMnF3x11LKfedW1DEt6ALu33CWXIUadLuA6jNk4GVzT
         bIzg==
X-Forwarded-Encrypted: i=1; AJvYcCWnPg4BGkXxWMn55Ri+KlH7QxwwqESaWxFy+/gLMD1omgwtbJw/SYCZ+xyaWkk8SO949p5ONlFQyA3Sw2Dr@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCYdSRKGNZf1Ay2005/Fvg0h0Burpy2kgnxyN+dqdNKhc22Jy
	/Dmt9ACql9Zj5tXuNEZ7VUrUGidVTAlLWxki1uhcE5SK3vlikytUccDQzSmcLU9SM6yYwudnVOI
	YkE19fN2lWNvHXQ0j5BVrRpuOi4VdL3UduftdG+sPHMXyxwT+pJ5S98v1f+/D9PpyPmCe
X-Gm-Gg: ATEYQzx608Du4LzckbNON7VzNzyDDiMFltueRd5mSm9fPU2DdEZoTQGC4quUe/1tgiK
	cYdwNvxOEiSlQ752xqk0VLvW/sGOc6uhC0GlrUO/ZPYgmR0/4v7+KmGW7KpZBKI1f0Y4aBmrEWi
	gPoZBALFwQxxlO5v1upFqL9XWa0NDbvKhSGvj9+5/fbCnc/+mReevjUriElEmJ3MUib2DHrr0XV
	7clwA7KfMdnHaA5nkIWcdXTkf03JMnVc49BMTp6/CM1QdYlsmoW9zbfcob/dgLLOepaisMmqT8L
	lO1XMXdJzI5WpNmqkXX3dUVaXgvBHPqGCKDC9nehMeN8Y7NZcO6g8+UG3fV3xw9ZzQlYDfxifR2
	D75Y9WNcl9xaZuxF6XYgT4Zc+0WCi6smi3IgAcwNzKzHLCbB1L3FfBCSHxTMuzR2qL+7CkRYtSX
	hsM50fiJ8sDnI=
X-Received: by 2002:a17:903:198d:b0:2b0:ac1e:972e with SMTP id d9443c01a7336-2b0b0b1744dmr17052255ad.8.1774420825105;
        Tue, 24 Mar 2026 23:40:25 -0700 (PDT)
X-Received: by 2002:a17:903:198d:b0:2b0:ac1e:972e with SMTP id d9443c01a7336-2b0b0b1744dmr17051955ad.8.1774420824646;
        Tue, 24 Mar 2026 23:40:24 -0700 (PDT)
Received: from [10.133.33.49] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm215601545ad.60.2026.03.24.23.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 23:40:24 -0700 (PDT)
Message-ID: <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 14:40:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
Content-Language: en-US
In-Reply-To: <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0NSBTYWx0ZWRfXyKSHdm5Agk5L
 qtgcXonCx4oxu53T4OIRv07HyehDLRWbhNL2Z0g09ijM61OSR711OQkAsdFwILBcdS0gxdGkpbv
 JY1FMtqLkWiQaZXyXYgV4P4d+3Qo67BoJ0rK44pa2t3Fult2OkQ1tN52u1o+yEHoJkBln3HR7gI
 vJ1/FrC9tow8bqTjKr9/i5DooBfj6ClbmE6QXgWx47vUvfMUY0i3Ev6oLM7ToN1nB7yeuvH/Wa7
 bK8DtabmEwnADKj3yhrFkdyIpF/NmI1YkocKjeESwYqSlg9pmCLt3zjl1p4G9USGwqWND1/kFI6
 NfLakNYxZVvSi0W3UHeaa70OMdzGPEpIhowei39VXbAHCN3BlBBKp0mSDCHIkk/CjmwU2HomYsQ
 ElGOYb2SW2nbiw82vWbbReM3MYna2D+WY2YRO3Ay0nkszFInOCjoynx8NuIIgBkIewLfMhl+H9E
 Ak/U/lx4KZqFRUJILvg==
X-Proofpoint-ORIG-GUID: mYmLimS1RpJN5-cnvq63q_QS1UvgIwLS
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3835a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=joGeVZzZuIZVIFhqNwcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: mYmLimS1RpJN5-cnvq63q_QS1UvgIwLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250045
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-99796-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62D15320498
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
>> +
>> +	wcn7850-pmu {
>> +		compatible = "qcom,wcn7850-pmu";
>> +
>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
>> +		pinctrl-names = "default";
>> +
>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> swctrl-gpios?

it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
the input pin is not used by power sequencing driver.
just give it some default configurations here.

