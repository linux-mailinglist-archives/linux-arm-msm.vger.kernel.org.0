Return-Path: <linux-arm-msm+bounces-102094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CizDHzQ1GlJxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:38:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE423AC26E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2262302DE0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C063A5447;
	Tue,  7 Apr 2026 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzepB7am";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj1+CMts"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9041F192E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554543; cv=none; b=H4Gx+mUydczYvuGf9Vo7BhBYofJTcxcUpa0ifLn6+A3g2rNrg3UuKiVZ62NOYIg7k7+2DR6d8emkU8yCqBsleqbaze9vJCuvBTaayJWm98Ms/hMOyotix/n/FnByXNeL7yJNDHTmibxL599cwhc/IOEhu4OB0JXT9wfSCau9RLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554543; c=relaxed/simple;
	bh=MwPyQOiSQ6RdUeIETXwp4mpKmHfQUMEjHUb4gqtjrKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2Hptl0CAuoTGlODcZM8HcXZ/aeyJRatupgEiIVnCHbA7EFCFj8Wpc+6l2DgzMZB+aGYMLyvP7r5SrORqav6VmBb3Uvigu3FCLezzA0uUli86N3OSf0ckKDuQISTfYXmbfkKO2IM0hgBTZJIOAe2vVKp+g87H9+2spwJgaPi8rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzepB7am; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj1+CMts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376WlaD1584681
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=; b=RzepB7amkneQ4mjW
	n/kBSwAwbeYO7us94i62DaMBfxEnQxK5hvTc84zycMW29DKt0PJoK6I7EEwm1e7o
	62G1hmwSs2O7XtdoKM5mmSABd/7kEGkqiL3XkCpir4eVow2JwLeCiyW38YRdc2aw
	2gLiDBSNnrM1UGS3PgM1CadkOWVY5OVvV6tb9CUSb8sUFYgeRnmRTSH58PhmylHe
	IXo+Zzu/acsprtXbOlCCRlCqc67BPeUe5ytuFOOAg8ahlJcUc3X+lZfm5cPk14SP
	EMLdi3dBTQb0dcZ02kdufIyJ72RQD92spN4WqFYvPOjUdYW+iMqqBXjNVWKqUKNL
	Wlq6Pw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9t35q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:35:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb39de5c54so160614285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554541; x=1776159341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=;
        b=Lj1+CMtsPfVEjDCfYdBeA9uEyulZqZziVDZUuF1Ks2Eeq9SnFTuaC3DYy/zVBDkWnJ
         GxQdQzFI5Zy0zVQOMv5ZBi0q+fXrE9ZdHr7rJlCyIxhUL1lpKH1Co3JKdu/odqECQI9d
         WBmJeHO8zhb7fzcSIqvJov0LpkD0/3qktb2gFMFl3WOcM/1sRFgoraj3BKOESxnO4SHn
         WZw2KZF/sn8DxtluTa/DyhDR3UR7jwaIRu1zQUSWhbRd01bLGypXBaBaHT8LN9/nCa4z
         5171DMW9l/h9oL2S3YYRuPI/rkzmKYgFGJAlBCk4vbOsm7UxQiaKwGThpFhmiwhoroTp
         WsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554541; x=1776159341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=;
        b=YQwWScRQpTk1ABYFhcSKFpToZ7o8wtiHS+5lhd9ithRO3zqdw0yZhe5UiQfvyaY/Im
         nXWvq58uJmdIaAE0GDTGMsUslfbgbP3kaqMSxZP1skfKnKcoa44LC2FLzGq8F70XGkbs
         2r0bQi+1rnzAAbLA6FICxy5xcwn8GCaHW7+Yba3Ve0UOUdAuam6/r2C/Ngzdar8Cd1AD
         0HyWecV1YSXSQftRTKz3a3Vkk5asEYmbumfWZzM+7rdS+MIdt31GNLHQyF3zgUSct0D4
         iWsttrwUHyf4rZgkp1gCixKH5nN4lDhPzZlDbBONNV6clhi6OiA5/aSdag1kreFduliX
         KDDA==
X-Forwarded-Encrypted: i=1; AJvYcCXv5SopTTorgFdi9+Q2UlJHEZDpReKnVp5D5kEA3ws4Xsw66aH85C+ewBZDXr72omICESh6/+i3VZcCpynj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcj5T1rIp0E1LcXdA+uKvPIpH9AgngKLjqAu09FHd7qg+rj1RZ
	Dx5u9jiv09N53TMm7qa6KAp/UXFEgSR8e4AIclZ0QfIBD6YslRof9Wqz5H1aVpweBTIE7MuWY6t
	JmOb90roRcHjMIgxsbTkUlNGrjuWF5YT7tvl5fur6GuEjialsCPq63BTCHmSdM7kazFeN
X-Gm-Gg: AeBDietlLl/5lEdSahwLItoD8k6r78GZXNUmkkeuvm3bQhKAmcPHwse6UvsfilCLwvW
	EIkDRgPIEjOlsCsr5yQC/tjuOm1MFtm3qMTGMZAWteLeOJ+b2Lkw4q7Uf8Yc2bXkkQ1a2fT4SOs
	KJu0yDu4pM+UhSFBSnbqanBYTfx6Z9cZRuBlNVbY4tzVvscEyMuyMpc3mTvXXcLF/3lueNkJshr
	dCrKHTmFA2FcPu9YuUZ9/CLeP23cfuewI5wfl4Du/UYjOyclozS+ZjnVEI9hHcIP2guBNJoGHiJ
	WwD1b0cWnujTaBro/DSmbO6V0bvwVmusNw0Y57TieF/s8yLw27NbGHqEy990HUDgeERcVBhQTtl
	fPhr2EiNoOAD+1inkEqsM8/j9jRJ/Hih9p4UcoAYLdEoKHo4zI3JA8Kt59vqzCUefXPIBMnEqwp
	5MXBM=
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr180451751cf.7.1775554541023;
        Tue, 07 Apr 2026 02:35:41 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr180451421cf.7.1775554540574;
        Tue, 07 Apr 2026 02:35:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a780esm4156402a12.19.2026.04.07.02.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:35:38 -0700 (PDT)
Message-ID: <14c61b77-d790-4e75-be79-caf8b7ee8e4f@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:35:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: milos: Add WCN6755 WiFi node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4cfee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=rDrCEZzy5hQS5nTwK98A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OCBTYWx0ZWRfXyF+dP+TEwGbD
 7Z+PvJYfFy4Q0h0ZUSeLvhyH+/9y1MU0E+fo+95sgfL38QZRKvWTvd5s43sLnIoVR/3ptvdFSEV
 +EtmI8PdaeMHU/zRlzMLqsfFhUfHio4uCiiPPf4+0W7KbGTBhKvBOtCEFLmcPH6kABRoRydB6ai
 xXBDET8AnhHtn/cYpCXBTenk+bBRSkv9cbCjeY1LzmGSyfG45SRlSgb00/W3uuvuFyi35Lvb3rq
 h4lmtxcabNR/DcoEjoftZGTecfxyOo11/+N5jj3t/DP56DokphAx/X9DeM74T6A5BThlsYtwZVR
 JzMX5ZJdHA6l6JBX45ct2PI7dntRfWYM8BHEVxxsFkpbZWbEflRo+pUL1/EK9BFJqH3CPu6DBw5
 MYnec+nfBa1Gb5a7kEYQr6WYX7g2EiedPRTNxdp4LT1dEFXQyAAUicmWNEIDX3o3qykvpCl5Nlc
 Wf8b7lgy6FSWLvVo6ZQ==
X-Proofpoint-GUID: YoPUm2CiS1juspVF3VeBjf6bWhKKDiPn
X-Proofpoint-ORIG-GUID: YoPUm2CiS1juspVF3VeBjf6bWhKKDiPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102094-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAE423AC26E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 3:52 PM, Luca Weiss wrote:
> Add a node for the WCN6755 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

