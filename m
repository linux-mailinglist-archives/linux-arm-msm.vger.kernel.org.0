Return-Path: <linux-arm-msm+bounces-48983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A03A3FF49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 20:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34EE61887302
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88C9252916;
	Fri, 21 Feb 2025 19:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNp1EfYn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4A6252907
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740164624; cv=none; b=uWGQOl4vtIsr+W1CSBbYC83ke4l7PoD+w7TEVGrhVdC+HiD1IKuU/001Ay2OEM4XDjcaXgZC9DgtvXdUrmNHiK8zf2312Y/armHJ7MFhYJqKrSHkwWtR0bzOuilaYxacdlkTB6kmQFdeyZe7obRx9I1t9okMdsFSbr3UPUTWyPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740164624; c=relaxed/simple;
	bh=ZoquaOJL58rkyZ4HQ2+CWELBjcoQjnrBmjHpzGMV9pA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNWQpfbabrZ9xs22dJmiA15dc1VxmlQSFpnsoaAhVbwEYt7svZ0kGcJadfKcXEUSYufLU4jGqI+pElnTBojurji1iRKSGGHc5aym1TF8x4P2fPbkwvO8+VEoS+byC5rLb0IWrlEpxGkI3kgGpwgCTKuS1ZkB886HJrg8FFXoTLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNp1EfYn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LDQNm0031358
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FtsS277jSN5Xe+S8TQapqC+r92RGb2FMagR7cCynoQU=; b=JNp1EfYnE7CuW49r
	ZcVsQ4paI5EtCNr1Tf2IlRWArWu8pdH2ikHd4BnDqsspfwby8tuTAaz/b0C6LXJ2
	CBkpHRn0tQHvG6d2SmcjJvspgf6kTKTuYm01eqI/YtYtHqbWMOcRN4Z6WAr1wyaw
	yiN8+6hNEn/JKctihb7JLLBsERPNxth3yAmICDoD4CgLtxw2JpL/OE6KmXZCp/Ob
	0i3E2BoDc+0/h6A/WDpkOtn8dJwiKaTaKkZdscNjkgWcs+PnVsZY1xJd8XwFLnRL
	AdOv7TByKwf7QZOC7cXxPXYZSeTcOjCRlgVnYI6ZaIojI3aHhCIEl3n3KP6q4xuQ
	h+GkXg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5jwrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:03:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-471fe623430so3617801cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 11:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740164621; x=1740769421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtsS277jSN5Xe+S8TQapqC+r92RGb2FMagR7cCynoQU=;
        b=d1QqGV8gxGcqDftYnO0PqvbJrk8gu7JPTM6kvmiZixEuUahpaP3oWCl1/ZsC0M2mh5
         fIsPJoXn96h3ieIbcoZf7tsC/qOWaLmhyh+CP2mu016c5kOfURXF4spI/W3rWGEpEz13
         siT4ohQXklWDdSHBw/ET7Q/TId3L4Hm+q7esryAHpCZKUlRVlWRgmlvGCtw+CPpLGh2z
         //JdN8fmwTiKR2omGkZG78GeL/7LY8hS7M+G3WtMBfFKmAwftURz0agmK38YfoEgBfZ8
         JD1hTrX3FEivt4YUr/hAf1ZtSw9vs1rDWqlZrwJQRx9I2JbCskftXiTOrE86kCs08raN
         uGiA==
X-Forwarded-Encrypted: i=1; AJvYcCVEurgRccQT/fH8X0XcZoTpYLQ7tUWiNdXca/iOq7SaF6p3hpjshsP10GlQDpb0BxPrgPjlwxDFPTGF1msg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywij9fzqLUw6plv4JQq3LQrvOt6yjBkMgprSqxXuk4jHWN3e0CV
	63QQrIQh73WhSkHGQLb5hcUJANttcmaXY5MMOfcq+RwtOWdLaRcKZAEADmJxNnCSXoXr1VRZ6wC
	WFscUKVHWxsxbaNELtx2pcMKOe6unupIwpKQYdtJ6fGQhaIR7EmpQKfi/nxTRK2xv
X-Gm-Gg: ASbGncudiadLOgmgGAe7no0jh85gaJjtYXllI0x8azilaF8BDrWdHhl7loBwqL+OLcE
	pays3x1iQ+zbEjG8m4Z/ffOa9A0uDTUCE0TN/dnZ/us8gexcWNvkm7C5G55l2AZuwestcaWHKV2
	HUCggLQ6b/WWLJMFgfQgPvztMmBkVgUx7D8evIVCUEJAJ2UwGjeJ7Ov9uXTsNSVrp5vAARgJpIT
	sM8uuXEel6wbyKLbWeAmFN47OTZyrs+RCUVVawp765jc+rOLkkkshzoYXctwJZSjGBcDNe87QU4
	ekG6yUO/G1fpKr0FxftaFaG56oQm/Eky/5uO4v48WsRLEaKwdUlUvjZKJYtdpd2KNV6mMA==
X-Received: by 2002:a05:622a:51:b0:472:1ee7:d2d with SMTP id d75a77b69052e-4722289edb0mr21824241cf.1.1740164621150;
        Fri, 21 Feb 2025 11:03:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/6ymxU8A/gN+SyZMPp6G+fjlP1FlKJqbI1zhyWG44Ii9xmTBAzfbyN4yqHmBTcykIfB+qVw==
X-Received: by 2002:a05:622a:51:b0:472:1ee7:d2d with SMTP id d75a77b69052e-4722289edb0mr21823991cf.1.1740164620638;
        Fri, 21 Feb 2025 11:03:40 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f70sm14049847a12.12.2025.02.21.11.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 11:03:39 -0800 (PST)
Message-ID: <c03dfc68-9463-4d44-81e5-e5727b34f0c7@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 20:03:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 4/4] arm64: dts: qcom: x1e80100-t14s: Enable
 external DisplayPort support
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
 <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-4-380a3e0e7edc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-4-380a3e0e7edc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tts_rBv3e5ZOtgbcXwj7GLdlC7us7qcE
X-Proofpoint-GUID: Tts_rBv3e5ZOtgbcXwj7GLdlC7us7qcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=702 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210131

On 20.02.2025 6:42 PM, Abel Vesa wrote:
> The Lenovo ThinkPad T14s Gen6 provides external DisplayPort on all
> 2 USB Type-C ports. Each one of this ports is connected to a dedicated
> DisplayPort controller.
> 
> Due to support missing in the USB/DisplayPort combo PHY driver,
> the external DisplayPort is limited to 2 lanes.
> 
> So enable the first and second DisplayPort controllers and limit their
> data lanes number to 2.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

