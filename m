Return-Path: <linux-arm-msm+bounces-112150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6gkjFqwBKGp/7AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:06:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B76EE65FD81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:06:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BxoC9Ezl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g5t44r2Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112150-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112150-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6ADA3011045
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA0340DFA3;
	Tue,  9 Jun 2026 12:03:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD1040BCD1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:03:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006623; cv=none; b=GkHqlcBdMMV+mInw9PELpNW2ij2KQcgcE18V+s+AihViHmutI38MLHuP08N3EliCi2ljluQpgJgEburQd4OyvzeUUOER45hgg//8fPCLajJ5EHbJVpa4UREVXfimE/De6xQdY1ZQzm/iLp/ekcm8X3NYwGMuiOLhD2GrLgNDoxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006623; c=relaxed/simple;
	bh=HfvR5gvfgsOcrHJ3L3OGl/zGy5KibbcsIuOZax3I7w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+YZP7F2HGXqi3aeI7rZbpZQRiDaY5uzXXVPIhAErODutsEvz1Jw5ymUzeMgnp4V8MZXIvW1nePJlTqiFgVg1n79GE3lbLR/dZ4CP3Vo6zjCxY/eUzdb7EwOlBSlL6TGqPC3YlbP7poyAsq8lVaocOUTidgWA+M5hbGa7dsdsRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxoC9Ezl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5t44r2Y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnWPZ2574418
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 12:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2yOM2NAjtAyFgfFhbJW5TqogRr+sQYkIoqann+cFi4=; b=BxoC9Ezl00y3ZCc9
	V6RNTeDCYrLxnHn5u7ZXXjKT4JnD0EgVuhlR4G00zRngdGw33S2w9srfMOuBkcaG
	WRpFzJWsFNLyTNKiyxW0Dha0ail5foTmmkZ0CC8U6BiWF/nYWr2F0hIKANz8T7kM
	jJgtD+3gVE1y2W/4LEVIs188XujqZt+98a+NohmZMUfmBe33rJIOdv803v3qisB+
	UaICFliMjPL/7Wo8iU9rf/jK4EynXDGN3mggxMvd3Yn3tDKMM76/wQ9ibsJRno7y
	TAmCiGjXOMho3NgIuuEcmCqNPu+UqYBWoVfsiVY+63RxMxRJF9yuPYgCglJ59+al
	vOs2QQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt0u8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:03:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59d93832d86so306792e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781006620; x=1781611420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2yOM2NAjtAyFgfFhbJW5TqogRr+sQYkIoqann+cFi4=;
        b=g5t44r2Yxp3ABwCqoK4hyF91HHK26M+5ziG9iRld25cqucLaEWOZlbRILWSqM9SBNC
         jCDBS55rgycn7ZzCUAcQ6MaT/inK9SefCkuVTleosEZe6bjxvOcjJBFiOiUgKsjhEruM
         z7AEoOn6oVOvE6+sxVJXazmGUrAR5PQk1CYF/h1s/NfvcjwK9sTZWs8VFP2PXBW6HyxO
         DyzJFBJkXphPGMxXQfu37lVA4xOWL8I/2xm0mwVd+Vw5zzMPq9pMBSYhHBCptvbcywCI
         NstuT282qr2zdxPdTOMFyzqDKLL9lfJ2WfieS5P2IL3iCiPMhr57Rd2u7Addm45ZdlVw
         55+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006620; x=1781611420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2yOM2NAjtAyFgfFhbJW5TqogRr+sQYkIoqann+cFi4=;
        b=SedORKcb/epzuiJr6piSBGXX3bpjF/vnrBNdl/bK0bjq6YdVffkDD2LSgaZxSED1gf
         dQEqjSTcBJEKOw8avDneM4eqrN54jvSJXqHpN/SGENngHnhba4AIj27CoPt7zH+pyjtN
         inz5o6+IgmE68xaD1S7ttXiEIPK65Iz+BggBp+O7KsuNmO3/YzoNjlv5KcAJysptbcfT
         P+FVdtYWmA7o1I979uEFKQj3j+ltJfbq+xJyFF7snc15gCb0pIwYizHzFy7Z95pgEPPM
         98bXY0vDxBbTPHb+Qq1yWNOUIRui8GJZzwkQANu/cAt1p8bkXFmqnQ+Q6IBMInepCQDl
         g3kA==
X-Gm-Message-State: AOJu0YwVBsjoiwj2Y+anp9R8OHmspukUyYXn6lV8qt8J7/D6C860iJeS
	RThmjljZ7ics/XKhkIBcGtLDPmqwSWOkwJTMKVtefA1FQRY9uIRM0nUOw2SDbmx3OaLu7+8/mh+
	Eq2P4oD+T1t0G+Vqt0WwfdeJ79vACQrmvY8sM4pe+elGePiP0d7f0x5AXw+HXheUsFS3J
X-Gm-Gg: Acq92OGRK8nX1FuBIL5WFU2hkj9gpSEuDrIP/3dkvr2LSPOwfw5Pg7H+ZP2H3ZQKfmj
	ddsvynFM5FnaiX2/pNYp9yA3XxbKf88VPjjvGdT47w3gKluM1CkHP21jusAWipiva9FRTen/yMl
	h73MN1af7ttwXdREiKnUY7e1cQXUqkvs6CH1H0U1xX6LiOVJ706TNqqo2G+ht6M8QmP0R8uGI8a
	Ovq8qcp5UMRJtFD8x4TDkzIqqcPrDnWjz47Y0Jj/BrFle/iRdKRf09hbDCRtJLxOPUKBl6nIhIn
	Fc6roHXEoiJmQolUacRTn/PnFK9roiCXC8YgvX0O3PheZ+qHbyauG/5BVBuX3whzAHFLY1HIwFE
	57kNluVjmsaZp9Nb8VQ7ox2s+mqESbEbsuzbB3A6+FY3m8OI9Bx+j8ig1
X-Received: by 2002:a05:6102:5a92:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-71913522647mr343136137.0.1781006619735;
        Tue, 09 Jun 2026 05:03:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5a92:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-71913522647mr343091137.0.1781006619215;
        Tue, 09 Jun 2026 05:03:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e29c0esm8716512a12.7.2026.06.09.05.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:03:38 -0700 (PDT)
Message-ID: <e9573827-81b5-4c75-9d1a-d59a4809300c@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:03:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal
 cooling devices
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yQMLB3_luXaaLAIZK-RukUgets-Gct0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNCBTYWx0ZWRfX3mxlxXeWX7ge
 7qJh/Vkpxoy03KQPAxVakej3T3anMpafcaoVHnsj/AX8KtTgVjwfpzVJ+DrXfX/JhD9LN2g0mxE
 Nj+nIEifU1QqC0G+8cAjCrZ+PqBW9AqT3AHQjdmeks6SP717i/7aFsHFGYcfFBTE0ozGAot2DDF
 4N44c4+06L6jdzQ3I5aQMtFFzlaXXRzSrvVBJr9pYM2Jdeb1zRCuyyvjmV4fHDT7m6/uPDfDICc
 CuZeVQW4AGJnTj439/DJz2a7KGoqLGLL6rhOp2SjEpcsmLWNkgxV4ASFjOJq7RHtdsap4AaLJHr
 FnFeq0WSCu2fkyu7Ss+rRwB5VD4XAjSlAUd/fUlFOHzdio3tfbr5Otu9jDJQLJ+XUvz7+YuoDad
 zB9/Nwi2taErShorGn5EVtIFR+ebyz0jyPeuuNhoSnZVGUKf66ElP/i2zof0gNJaGoffzqPObBp
 +CTvHbgBUk1yKWz7RQA==
X-Proofpoint-GUID: yQMLB3_luXaaLAIZK-RukUgets-Gct0Y
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a28011c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=x89XBY5VHgNHtdzuPNgA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112150-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B76EE65FD81

On 6/9/26 12:22 PM, Gaurav Kohli wrote:
> Add support for Thermal Mitigation Devices (TMDs) to enable
> thermal throttling of remote processors through QMI.
> 
> This enables the thermal framework to request mitigation when remote
> subsystems (modem, CDSP) contribute to thermal issues.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

There's no other signs of Daniel in this patch, please fix the
tags chain

[...]

> +static int qcom_pas_setup_tmd(struct qcom_pas *pas)
> +{
> +	struct device *dev = pas->dev;
> +	struct device_node *np = dev->of_node;
> +	const char **tmd_names;
> +	int num_tmds, ret, i;
> +
> +	if (!of_find_property(np, "tmd-names", NULL))

Let's use device_property_present() instead

> +		return 0;
> +
> +	/* Get the TMD names array */
> +	num_tmds = of_property_count_strings(np, "tmd-names");

Is this something we can stuff into platform_data for a given rproc on a
given SoC (for which we already store *some* data in the PAS driver)?

Konrad

