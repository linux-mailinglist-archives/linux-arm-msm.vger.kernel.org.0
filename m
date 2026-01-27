Return-Path: <linux-arm-msm+bounces-90739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGgzIBWleGnVrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:44:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6636493CD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D68DB300159E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED70D2DC34E;
	Tue, 27 Jan 2026 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmlNX7qr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQwsMGnd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F7E346AD5
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514256; cv=none; b=jnPOrSvn7TwOg7krihh4p4+STD9OHAqzGtnPtqu/ekup9Csc/5U8I9k+mciKpCFsFUnhx7oZVEw+QIi8EwHj2Zw1t5RTAbT7Syf2eVX/5LVzXCRm9R9cBEXYBpEdCLZqVSZvidMIEK3nEioZh6v70P72l54e059+VJoh9m6ptfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514256; c=relaxed/simple;
	bh=uhKGH1/X5QoMDU9Y909puh1TcbXRSNGvHFAfBecwQIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmAtFrv+8KMktaheV/1NbmdbNYXTTiMrncS4t+SzPoh1DBmuJDdwQOjT3BKADk0qEZG0+7eOVay0wNO5zgVfDPei4uqGz8HKqBIYoFzDSCcp3nGPqHWOBHgzidfxPPmK7BHrP0J7dV7PuhBJGvS4kEbHTal5N0Sbc94LT8dXg1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmlNX7qr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQwsMGnd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAKZS5496005
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxI9dE3xrBh6NtBWfmZagSJEXbQI2QWoCu3AI0NzVPg=; b=kmlNX7qro/0T+8WO
	PJuux3zvpV4AfvJ0ZQoYw9ldK2a5D3EGSpKTrmNKz9j5fWKUv6guHKwEQQDskcz8
	QDG+jrJri5asL0/VQ272+TTGNJrJxy97a4wD7czTviP7XwAtlt1BVOvFUJz+5fLB
	km+oFy/Ja6tzkCa+d6gfwidTimR0GAtjSpqKrnkTyCJFvI2ze57BSFO2lo7xveeK
	Ub2bvsCKhYL/GvESBGG0/Ki9WgvdKr7zHZ1d1KBePoQ7i4ohh9/xA87+J2rJRG7y
	7uov6AHlryrh1zHoVwQMfTNWW3v33kS8KLZWgJBSzm5HqThv2vW//y5Qc2fN1/KV
	WWF5xA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bjjwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f77be4f283so12907101cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514254; x=1770119054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KxI9dE3xrBh6NtBWfmZagSJEXbQI2QWoCu3AI0NzVPg=;
        b=TQwsMGndhGy+ZX5Vo9/s18BzYcr3YSyBKHgbZOovHESzWRPoQQz07X0T2ar8d6qbHh
         cIUnd5G2343OWoxvMSPtqZt2UuqdQKPoNWRoWzQ1WiBSUp13hmFiZtdCpRGKAfbcvXg1
         Lhl0+oB0xmKVW9ILwWc7YxVsRNfqWVoolcb86CqMb19CskbgIAxKjpNQilcpWFLUTxMf
         bW5ii1HV/ONLTJkRhbQslD6MI2KSrqPqPl6XZv1DdUd/iJZ2AOC55PttVuA8uR+Su8KZ
         Xg/M5K3Dal04qvRryLn8V6E8gg3TE9Ness3yeclRmP/xgUh1jjheClZlM40z6jPlJkqG
         ET3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514254; x=1770119054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxI9dE3xrBh6NtBWfmZagSJEXbQI2QWoCu3AI0NzVPg=;
        b=kpBcL9rVUL3nQuAPnfuGzyGzZkDGUHiAXPRZ6g8P0lwq6X2Y56RgIe7kzdOo6VhtEJ
         P0LUpoO3eXhKrz2BceR5sQmAg/A+7xtItIpYCr8AB+ZxxVG/68biSMTdREF48PiDySF+
         +JjoRHQpQnmS96l1P59pEHCyGoY+LZ/clT/uATNgpFg93vnGa3epQxPM31zK6K3mmtuX
         8KDtYFoWxiry5Odall8vM1Y+AP8fJJQsj+LwxOdhkaw9B5kMU2UnPbggTQlkA1cVrimz
         JoMwMU0VeiNvXZpQQfS07i5oJRXJXpjOihG+cW7/DIZ5HVNEGW/SuK2YcuwL1e1T7Jzf
         HDRw==
X-Forwarded-Encrypted: i=1; AJvYcCUoS0cChdP37rjsF5pIoxG91eFFCfQCvfcOP9zo1/UWMSpAJLgTkWc1yEK1uBSYeUNe8KQtR1Yqd3Yt4HtZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5krY17DVyL5atMFZeCBmGTIsFMbQdTHYAdbkEVXa9HWHmOwvs
	tkNONdOpCVGw4873RQwi27bdkv+xiG7kw5fwfjlcWXjEBAFbs5GXSZGzERfOWJUi5WUzxoOmxWa
	LlZW0GTaT3Mpk1cG6vKpmqZ5QDp0ZW4InGeyPz0vjtLQIAYFoMjoQGaziWSIHjuOMKlT+
X-Gm-Gg: AZuq6aLFS1QfttnDmqAn7K7DYZQlpVPpXW/z0RaZ3BqhlclCRsotoBFF5/6nUCmb8AH
	utaw8/kwZF5shwouQNWyJEqs8LrJMQkqckvR2sXW78/uOpxtFcxEJpe47SV28grnGs3F0HG49wT
	W21r4v5LpO62GzNcOuEBlOzqZ9QXUvWGXzN9V5vqTb7lajUHAByXsbzftG94xSRxJ00lfVmAl90
	mUbEXSYQ0xglgC28KuTvCMR1AFoLnvQCL4cXJGMARY8HTmUchDXKSSe7R9RHwxKtW4qZWOKui2u
	rLZzVfffzRqnfqCfvylcxYBrTL3v7e0bb3IE+dH56ACWheA6pLc/4nZTyRz0QqEdu0IlWoM98a9
	8ojzMMk4vs/ebZiHN9yx0BJpCOEJdS91gafTT6qeGqKyG/d853Iu0XUZmrNaq+qkJ2es=
X-Received: by 2002:a05:622a:11d4:b0:502:a1bb:632a with SMTP id d75a77b69052e-5032f6733cbmr11974041cf.0.1769514254108;
        Tue, 27 Jan 2026 03:44:14 -0800 (PST)
X-Received: by 2002:a05:622a:11d4:b0:502:a1bb:632a with SMTP id d75a77b69052e-5032f6733cbmr11973831cf.0.1769514253738;
        Tue, 27 Jan 2026 03:44:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b9489a4sm6437799a12.27.2026.01.27.03.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:44:13 -0800 (PST)
Message-ID: <b827b1ed-e171-4c5d-936b-dc86daa1f540@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:44:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] media: qcom: venus: flip the venus/iris switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
 <20260126-venus-iris-flip-switch-v2-4-b0ea05e1739a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-4-b0ea05e1739a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KvlsxMl6KM8MAOIUyS7fCV6jc8vc-7tF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX5PPPY7sDODmJ
 yZ04nm9jOp/cG4USqUbltx8r/R5uhwgZA2U0gPL5ifOeWdFFVzS49p0WaQ0UmEJRbD65TQnJ/Gw
 Bnzg7/volBe0ePZvLONsQIMHtSmFAU6L7I4Ntx6bscPapXQIZyGNraGhwNEij9HdQTdTD7lzFnA
 bo52+9oXvt9HOl5APG24G7c0onbaxLonygIxuKw4XmXdK4RSksguT2PLjNyTV7jPR1yH0IzyK0Y
 1wAKZ29rQTtE9pq28rn1C/xq3U7wdlooGx8u7tHD1qOM99c6Ibtl+MkCM/Xg8RFr2rXdRQGMop9
 PW4VBhB3CEq29aodHu6CFmSttd8hzPb5Ld27aYFtiJSAHWSV0YdgD37SMhx65O1jpt9nOKxs332
 r4NGC0YZO+fjkkY4QWGM6QQIFMLqp2NHHho3w9VdWx4C3+VYOg/5sSJ+i6KhMj7pw319QYrDSLI
 Ouit7J1jIUqjqEPQOLg==
X-Proofpoint-GUID: KvlsxMl6KM8MAOIUyS7fCV6jc8vc-7tF
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=6978a50f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qmvEUQ2JdN4waMkMqIYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90739-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6636493CD0
X-Rspamd-Action: no action

On 1/26/26 3:09 AM, Dmitry Baryshkov wrote:
> With the Iris and Venus driver having more or less feature parity for
> "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> switch. Use Iris by default for SM8250 and SC7280, the platforms which
> are supported by both drivers, and use Venus only if Iris is not
> compiled at all. Use IS_ENABLED to strip out the code and data
> structures which are used by the disabled platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

