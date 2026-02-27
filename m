Return-Path: <linux-arm-msm+bounces-94368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAA5HbgWoWkUqQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:59:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D11DB1B2736
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B518311EB4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 03:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB4933D6F6;
	Fri, 27 Feb 2026 03:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xo7ot54E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SU7BvwWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC72C33D6CB
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772164772; cv=none; b=jFUv8wtycOl1BlveNviX/Hphp/1Asb4rULX2bF/4mGOQF8pedDmF1PBxlnXdtY+fxww+08NlRBWMGvfYRQDWGSF34JFDbWoV0skbqfHNExGCBI+0ehh7ICUbwHjp6Rwxcc7gb3AvgAyMhNopXnKshRtUOQb+9fzuBnJHfpBVovM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772164772; c=relaxed/simple;
	bh=gxEYHXuxvHBCiqxOF6wVGXUMG9VsVqQNXOCka8XkgoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptXlApvSRRMm4YglKaKUi5B7b3sVhORcWZeL3SWy++3D1fj1KCxah+pB9JtOzyvBz/X0Y/2ni7Na1LhmaFArXwA6i5Mt+IYd8cNyvzQPfX6hoRN33prwyxIWA9FDJeEjudl5fiU8qFvVfz/VMEL7/0jG7WrNXl4By7qeoFr8w8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xo7ot54E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SU7BvwWA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K0L32982304
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxEYHXuxvHBCiqxOF6wVGXUMG9VsVqQNXOCka8XkgoA=; b=Xo7ot54EFPVQkFRr
	BOaxbvTBO5zI84gjBxziste9V3AwLVS3CCz/pE+KonBG8rAkiuAkIPPjbxsJVZCa
	aqZV0ateyq3Dmn+AOpT/meTOAWJ8ER+lnGhRKEJ4q/kALNqdca9qmCGn7JczTQrI
	gca+u+Zjv4MG2aLrbxNNXGdyESE/Daqxat5CPfJUZFtq3wbCGze6api8KNkjBjyw
	Wiqpv7meyXeTXpNUATZqmpe3qrWUNYPECWLkSBihY3wRmRjqJKC6tQ8NIBVkedaF
	9pr0oCfqZ0ziGRX/rGgNy4OaFYNru9K//qkgxUTYo3bwxlB0GMykQsZkTKyckbmN
	GUVIlA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v3jwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:59:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae0d7f5c6bso8695805ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 19:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772164769; x=1772769569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gxEYHXuxvHBCiqxOF6wVGXUMG9VsVqQNXOCka8XkgoA=;
        b=SU7BvwWAp/AeBGVszCpUWTlM8/CrKJdYrhp8YNYq+I0ap+Wwfr97o5ZYo+meNM2S9c
         Wy0EUwX8BDylNbJ7xBewKWVLNJKjITTcb8Hjqqu6ggufLpfmqPjvjWH0Ya4FOAwaZ/7m
         pPozEY7fNYtclYAJ2v9rTARgkMyeGGLnkh5QdOQtB+5F9X8fjwMcCLdNFFOLY7v+zogR
         hiSGsHptCYKw4GAKPB94+NsZulrotHN/2l2Ufff8NnAZ1FZ/aIIcSmqNsmWH7knxkxc8
         A8fhSbD9u7Fexu48fVibLkaYMGu3B2GynAVGv4k3i9d6X6YuHZBWHpcU/CPNESTO4ovT
         Qa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772164769; x=1772769569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxEYHXuxvHBCiqxOF6wVGXUMG9VsVqQNXOCka8XkgoA=;
        b=ajm4s4NtIu7MIc7pjt0ZQ74LfJULszLeDbRuSWuzal4d09n9nUz9Hq6gbAHCXcyYHZ
         hY7JDv4O7Wk1xB13w26rueC4vQWJ9LDY5OVHd/IU6xEE+VjBiBw0LT6Hvjnk8H7uGsbF
         bodPnDTJ+sbjeUqnPSGzazmjYKEUCbYi8WnceBrsctXIfw1P33d0bpP3xf8u0BHnJLPn
         xRb36CGs/robRdJypBZ+ttqUKRenMiN1tuyRmFK+M4d32NNfunukzhYNnpyKsx6YRmQV
         VeG67s49uyV3Vpna9wpqjLl/6pfIxkedRx8M4PQykFQO5A2tDU9SupS2GAzGK2oLw030
         sgeA==
X-Gm-Message-State: AOJu0Yy6lxk8w+331iO5Y7ZkoJ0TOfu8iRYAzeRgMrUq1WKgaakUSfsE
	0A93TbeSpId8xrzXNBC4QLaD0TjAMMDaSMpjijSqA0570JjvGnFzefSTzlwkUkv4mTa7ut29pPA
	KPIbzxYWy8k/0B3L9e0ge9WULsU9i7CZLvnHPYPuVc2PdqGib2zFp5EZHSnAjXdvGpj0=
X-Gm-Gg: ATEYQzyKjWJRWu58UjXDOEGRwe3hywWkcTb2f/zFkDyF7R0rmLDAlwRZNulTU/WWNHc
	wGGNRvvTTqOLDGcWlXdN91KcXeYzPaliYphrfgJRRk9DILG6xww9NjaUayf8xT8IviAvxqWbLyY
	tH93Wz6SLzsYz/s299/dbsnpzd+XtEpYH74MM6H6imInTMAuDlhVxnScH17NXJ8yDF9IzWV+3Oe
	2FbhDIXols81N0ReP/r3FIi5famSmzBDanbcFnbjnQnT8Fi3yXV9LF4oAqKS4u1XaQjMY4r59Dd
	eRTtpjFAbWT/fPwfQZGuBnH8kX+IIlN/WchN7Jila0pAnDbMBqrt/Gqh70l9YQ/1wsORPyPt3wm
	I1jIda5uZ/L22vM+h3MiWgPJ4WzkReLc9zkz4Y4K5QXngXoCaBQ==
X-Received: by 2002:a17:902:da8f:b0:2ad:ec0a:b946 with SMTP id d9443c01a7336-2ae2e47a168mr9747445ad.3.1772164769296;
        Thu, 26 Feb 2026 19:59:29 -0800 (PST)
X-Received: by 2002:a17:902:da8f:b0:2ad:ec0a:b946 with SMTP id d9443c01a7336-2ae2e47a168mr9747165ad.3.1772164768831;
        Thu, 26 Feb 2026 19:59:28 -0800 (PST)
Received: from [192.168.1.9] ([223.230.67.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff34fesm3435271b3a.42.2026.02.26.19.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 19:59:28 -0800 (PST)
Message-ID: <738ed5dc-b018-457d-a516-5ae424854fe3@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 09:29:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for
 hamoa iot evk board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20260211093045.2595126-1-sarthak.garg@oss.qualcomm.com>
 <ac78f12a-b10d-46e4-97b2-57d826ebd893@oss.qualcomm.com>
Content-Language: en-US
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <ac78f12a-b10d-46e4-97b2-57d826ebd893@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pMIOTBgneYaw5iEPwJgKwQBCyAF-c2dp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyNyBTYWx0ZWRfX4NFCIgLZNlCu
 RlRC+baPnu+oNN5wPezepEoHRVO8zMT9CRcESVgipVcX2LKrrGBPImZqF13A1FBwtgfOiCTR8eG
 SkFkpt3cw69DFhPSx+i0MqR1gA4yr+Pw3VrQ3Hz84lY5g3QN6GYhpIQjptRFcdjIQGebFrVGTh/
 Q3wF3FDvf/XeE9p1I5py3TJhFHRYdPLbGfpOZqOyUhQMWSQgNcrGdo5kCymrq64ldiwY71tzsgB
 VEsOXcMnh/diiUb7tVqomLBEGs8zpEN2enJamdfVrGkpYlQnUJdaoaPCu5qJYq9xpw1TnF2SvZA
 ArHzp/dU0REg8yDgYy/gOcIM5VdGOY7gls0piONTFv9Qq3NmdzMefERvBDhmnByzL/Ghmw5pXNw
 Ejb69Pg9o/ptQ/K1UJoxB+W7ySA1Nw4awFHj2JZPPDWF1v6OAa6cwCRI7iUlD7zyTKvryzbX8Lb
 VM2SsMpqvNgQmWeh3Rg==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a116a2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=vlOeVC6CDfVrUwm+MHYtFQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-Bm3z7QMHiO_7TBOdAEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pMIOTBgneYaw5iEPwJgKwQBCyAF-c2dp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270027
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94368-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarthak.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D11DB1B2736
X-Rspamd-Action: no action


On 2/16/2026 6:23 PM, Konrad Dybcio wrote:
> On 2/11/26 10:30 AM, Sarthak Garg wrote:
>> Enable SD Card host controller for hamoa iot evk board.
>>
>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>> ---
> nit: omit "V1" for the v1 in the subject
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

Sure will resend by omitting V1 from subject.

Regards,
Sarthak



