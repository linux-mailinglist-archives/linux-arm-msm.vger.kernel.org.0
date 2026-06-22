Return-Path: <linux-arm-msm+bounces-113984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UQIPNsYnOWpGngcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:17:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B936AF5E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:17:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HMmdZBaE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iLflRdPl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113984-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113984-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4093F30297BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF852BEC2A;
	Mon, 22 Jun 2026 12:16:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D735282F22
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:16:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130615; cv=none; b=QAA+9qcl/rBK0UIxlsXT80znII/qVLwCgytrOCCz9LEWcrSV/ERjewaSAfsLw/Nlk4NgOr/OkBpllEKWMw4Fgv7aOZaNwjh5Fo0P2Rnn/HwqDGmHe/yrQTI0xQ+foyjmfMHegx6WezWXe13lA3tl7FqMC1Xu0I0xO6ZTRKSZ/R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130615; c=relaxed/simple;
	bh=d1OMFEczesT6aey4ICBnXcgo97VHr6XrDOsG7BRThEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHDsHYv10y4CZOrQUUkIRSxVaIeFse2h2NXHzFAkzWS7RmAartBuc8EtVdQ5YJZl1Lbe8Lz5rPVvl55p2NY1gAVW5viXuiSYmPi8uQiIdxh5fj5thsYILRp6G+9f0C9/MkOE0Ax7xgQ+yuEvYRsBlfpkg5B1Lai8drA5xH8lJ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMmdZBaE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLflRdPl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoFdt941037
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJOjnFQkq5H5GTU+SJrXEcC99r4XcJ7w+h5QuLxokTk=; b=HMmdZBaEF5AbzHWw
	Gq2l8ImwCXCvsGgHcj3OxVoI2aCMp7xXVYzYlvcTbrK6YtRo4+YA5qxjVF26kI0v
	VtwaSytjsbUvP82OVx1GAtn70FFzLoMUrxVP0ED/aR9Uxzy5RR9YSWveuATA2Lue
	QQFgzzk04VxF4MdnDTKUt1LeKsIs9HUsLazGrKG5wb/SbPmCnLjIy3nWZzh9zx8o
	PNHg9aWJe4FCTG4BM9wLIWfzscma8Qh1UhCWFX5PPHprl7djekgbaZ1jBLdO5l/w
	d2jPEBTx5xrtPXfCM9+woOdvr2kzn7mV5C8JwAhV5csDGD1tmVKPFHth9iZq8CQ9
	C3wGKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8a2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 12:16:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-920f826bcb4so32582885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782130613; x=1782735413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJOjnFQkq5H5GTU+SJrXEcC99r4XcJ7w+h5QuLxokTk=;
        b=iLflRdPl3rK8zxMkHG5IWzxJvvT1x/ZUzWHYryNTwaRf+GQXgh3U/W3yUo5/N1R4Yf
         1snHXbVEDNsLO0RJxKGLoVVR4a4UV1KXX7VXGRABHzOqvp/505oRNouAa6Z+eEgcj9zs
         yoEhbmf/WINsJWr+1RWOoWAAcOUgM9kvrVY/XvMBZ947N6sSWtOsETW9fi63tM2lKH97
         iP4rOt29ZauOyzzgb8wHJX9kUZeuqpgoEYpAaBLq+9kjurpmm7MIPYIRleOQyv230UtE
         OOEtmipSVPtGKxgBHCVwMoF/1Y0oT8J1uN23GT12QnHYmfTuNCaANVTr39Lv8yKyWJq2
         zBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130613; x=1782735413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJOjnFQkq5H5GTU+SJrXEcC99r4XcJ7w+h5QuLxokTk=;
        b=dHPGFxdhYxJWNLAHiHZUvH5Pruj2brvDPFOXJ5LUPqADEUjO+zEDpykXpmKKvdyIRQ
         vRb/EBRuOhUX5Ai31ygEJsVgd3zZIwrWDeuVFInbbV+1wDvb4DtcMG1bgyf5ajqnFUOT
         gJDlCk/oqxOnPCTAdlZCvNZ5MrmkxOMTPzF4YOnl9+F7c4Nt/XXmgJasLavbxo0oZroY
         u3kiSVlBXyX79vY9OwWakvoxKBFjrOY7dvRmjZwBdPLr3qMSt0XHUV1RdZTcORHcdTkD
         qtMh7LxG0+pgS9Il74n8l/QS/CyUMTZ2rKxwYuviSk+odqN5eU2BSwXH0Uk4uxmDlkAG
         drog==
X-Gm-Message-State: AOJu0YxVZyN50qppL5tEFvVTA+xmHdfJEW7HqMfCRPnPr+wVDdJmOhVF
	AY2aggAe/5W/Oj0IUYL62CWyuH+Ga+PtgVPVgM/DTPobnGHYXk900PNdAXGXhVhPAPe7/+UjKYO
	Q8wjsBOuxI+RYKjBLwoCdSWwAhAdvqIWc6G8dn968joIH00GKZCWkFm3WlXjjMOv6yXA7
X-Gm-Gg: AfdE7ckYAXGCKzOGr9pgZb6p34IGbDDVejWo1zp02BdhyzkrIQ891dFaBAyEbbWjGDU
	Cpv4AeGFOkUOxJaKVACK2wICnPLuuuIxSaqWN/ZrnNEyB9q9FfQiGJ7FPqPx9+X9HAuEx88E5+b
	XUL0W21anYZfUnn+ODbENMDe03M8ao0vFl2kA/RjAfst8EdNEd/91mFwKMlkP707vrqDQ2/HKuQ
	d2Wvm1BwqRe6eBTg2EyXhjqwmdQcyIBezhAY56COo9at1Q8v+SZxJxuLKCTHbwXIEETtNkV0Gx0
	0DqIUtl/YXgBVvmHGjuR+oFzrada9a4+fmuYBRdVr3TnYL4HxMsfQI4DTghDnjNw8/FMcZ38E6k
	uMNf67533nApYtRGcbX+AAP2/NYnzFJMFCOA=
X-Received: by 2002:a05:620a:44d2:b0:8d7:ed38:8189 with SMTP id af79cd13be357-925c393485amr18401985a.0.1782130612886;
        Mon, 22 Jun 2026 05:16:52 -0700 (PDT)
X-Received: by 2002:a05:620a:44d2:b0:8d7:ed38:8189 with SMTP id af79cd13be357-925c393485amr18385885a.0.1782130610418;
        Mon, 22 Jun 2026 05:16:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5c268375sm1647281e87.16.2026.06.22.05.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 05:16:49 -0700 (PDT)
Message-ID: <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 14:16:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyMSBTYWx0ZWRfX+Fh2rPJMaI9a
 s6vOHaf3d4Xv2u2ZQvfpSmGBbnhrV6zB/jNKfm8XdhkLoZy/3j3ZJJwu81DzpgjvAOxZfInl3U6
 5WZ/Hk7kTCG98WOwI4qcbBASaTz28l8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyMSBTYWx0ZWRfX2xJzfOhajYx/
 MXFusiPeqOinyLDXErtnuDTJNs6WSNKX1foMMox7TUoMk1H38R3nNkdk3rgkdiJeQRBvxCiqXZy
 uFr1CjErAW7Wp3Asp7JpoPq2OUDkaEd4z5kooBf3QyQFDpfNvmv8FpxbG26uba3g4hcXk16MNYs
 Fjo9h+dRQRowpSiK66xcqAP9bMDG7ewXTA9NcrlbGnTBqYD59vuUaELYk0ttXN2m9u0U/jU9Foe
 QBaH5tZNy3ccbwtV3vbEp9qvo3jp8AvQfpWueVRPYD7AFpdOArztwPUJU0zFZ88ZRxCfdkwvKoR
 T2Meg7CVG7WfoWSl6N/sXmPY0Sys6ieNPe0HLmw9ozXGrmM9SfwCcb/yztwsb58gFopUAleKRXF
 iDo8oBNkYWqyrNNrhYZo2gd6uNRCeb5ohlifQLZgXhoObticGe6u0o7BLHIRsMTCF0HGR0Y+srs
 6sosNJspMZs989yrUCw==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a3927b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5oxNwPwbBGZRK8DKsckA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: A4FJLGJuWrZcPo-Cx5lsFDm4CDVmaRyp
X-Proofpoint-ORIG-GUID: A4FJLGJuWrZcPo-Cx5lsFDm4CDVmaRyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113984-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51B936AF5E0

On 6/22/26 7:11 AM, Qiang Yu wrote:
> The TCSR clkref_en clocks gate the QREF block which provides reference
> clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
> and refgen blocks on the CRD board.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index c98dfb3941fa..92b929ee3448 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
>  	vdd3-supply = <&vreg_l7b_e0_2p79>;
>  };
>  
> +&tcsr {
> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;

l2c_e0

> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;

l2c_e0

> +	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;

l2c_e0

> +	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
> +	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
> +	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;

l4c_e0

> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> +	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
> +	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;

l4c_e0

Konrad

