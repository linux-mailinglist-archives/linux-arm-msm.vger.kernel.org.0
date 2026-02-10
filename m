Return-Path: <linux-arm-msm+bounces-92478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IGAL5UIi2kdPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:29:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E19E119A81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4AA830329B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4470E35E52C;
	Tue, 10 Feb 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mpt+so5F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9Ze7fQ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20833F8BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770719378; cv=none; b=aUxnqxjECxy01hPoHZwBHVlPDIkBr9nyayTPCMHIMaFZHnjFKA4D7FR97e0+WHktEOMzJTtnPRhoR6XlIDZQtNtUmuQdOsMkNPT77KSe4WEBmVouNDxi6xeVv5ILDLYaQr73KgrT1etQV7MJ8CuJeu8uACDvsJ/uKfHGpKwE95o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770719378; c=relaxed/simple;
	bh=H+CnyxWlK1/RWUajLsjk2IlpTD98xymU41dsOhZiuI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBxD083mqQNI/wxCj3N29P+DZNag7Wer46/Et7tc000WzSQptKgOa3r0WT1SdDrRTsrG8iX9MuwSfLMY1W9setp1wdjwR51Pp1a6XBsbnZW3IDMaBjlVbWrFX1JZIteqqwJ0nY2MSRzXE71JUFtY4iTj1kNKZmUaUpRcL6ZzcAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mpt+so5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9Ze7fQ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A76xBl1151739
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyShRs8H98+Iv0NfP9uKmh8Iz3yjnfMsJhckbhbT2SA=; b=Mpt+so5Frzez3FO7
	ONKQbsYkrb2N2saBbg+punr1pmCLeuEcq+DE0iO9XIe7M577EDQ9RAq+PL9eywsi
	HhO55MimkqGwVp+0IKJyBeIrPyxzwPG7oQScBZ7afp46pjz8B2Clm7MkjwYmI+96
	19da005he2DastLVR6PakgIVXFKoag1YwWKHdgCegEHEZe/2rQZ1oRRcUyiLLGiu
	n4NFKAAuRGrhwzV5K8VgXbSGm78dgp1pjmoPnDCQS3rjjWel7RQtiAYbUS86lEFh
	Wk6c2mDBz7E5mP+xaJH4SsGECVW1yUCN7b6Suul9TEhBuAvBzskiz+OZ69lQkTha
	XSQcSw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c800j8q3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:29:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f3ed6e935so7991269b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770719375; x=1771324175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyShRs8H98+Iv0NfP9uKmh8Iz3yjnfMsJhckbhbT2SA=;
        b=C9Ze7fQ0BcxwIdnzP12mIjIluLFTAGkuff3m6qrOmnXCIWGJS6os8Osq3GTT1ld4uV
         jEeBh9YIlrE9oE7rp5uq3DzaspeGtWL+iKNKZmRn8XmOZ9n9FZ8SeCvs/VR7I+gDtSQu
         yTDL+dii7bncSA/xQ/uXef4mMkAiOmwkyGsk1GAxfWIGpDizdEKESxVmGz4Ep84QNRS8
         /d9Cw/bEIwJfxE8dVKbqwyfSPxDZOtULz1dhFRHfBn3O4oGp827UYJyjDepNR0Os4H/p
         kJdv4U9BQL2+Ysf4Cx7yThTO81/BitcaY3yxU7x9c4KfRj1b9b5N9JejvTN45pIFbXtF
         MD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770719375; x=1771324175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyShRs8H98+Iv0NfP9uKmh8Iz3yjnfMsJhckbhbT2SA=;
        b=dU/rsAHnt3M6a3jQZl/RULEz0/rf92DQoOVLhItIVPPxZl06X3nJXm5nzBkm++wPmz
         +93p2SnxKCcO8IZvbguDF6XH/y0mllz4wlV8pVq2IYgyQb37H7E5WxFDKpgSbfKUM9nX
         BbaLa9DRHAUxHSoZxQsH0Yt2HThYMfOkqHgiBraQeKp7EVY71XvTQ6WHiE2Ex4gICIfb
         7jY0evHDvFUXE6VUqx4s8eETfLzVlGaeN51p2u2YaO1wsfy8rFTCEsAoS3jsCblgm/C2
         5RfxFeu3KVroPEjP9I8Toi9G4/yh3i+HxOPzua9Y2zu+KyJgD7nEhzIOzERLA7eC6ee1
         OvuA==
X-Gm-Message-State: AOJu0YwSFzUtwhGBGXKEI19R0ZSslTPsumqBTd0WYlRa5vuknys9eGQl
	keYmWWjkbuQms+Lzdnpfa6/DnX+MW3R+ifXpJ0hH2WamjFUAGH4BpDfStivNVn90watlIPAfSCA
	5bB3Is0gSFmVxv4cPgrpUsKZqPO0aRXexEj6dn1wC40mhYx661t9dJY+kaU7n8rnynsGQcTH4dZ
	RD
X-Gm-Gg: AZuq6aISOS4FAciQV5r0w0dsF73btnCG69t24N3wztSujHrd4ebexVcSkNPLQ3nkL8u
	UIf2GnwcJpOskf3csgta/RRFw4Joc8NyoqZ70CWMXm8FjdiXQfIf4tEsWUv7+OSWZ/wrfz+WV7b
	n7Ckj2Q72/5kJ5BkpWIASSaAKqP2ZeeO7AT5gKDmOKRQmHHvArm4LdJvUBvizQZ+zOUtX8fOvkk
	9H8Kpnsqtbu5CsSV84n/fahpVab53f/gKPunNSDe72wuRHkzxxmwnYp6Os5AqhaMllPKUN9zZv/
	Sy8sYHmy9ZDhu1yDNVFBRycO5fY1tN0EeXRmHirj9sNzxNkLsQZg4RhJLoOtPTgLhZjkkQAJHfj
	1DYxq8zxzhpAx4Xl+90SJISbAKXhrerQ6JG8Oi+7bg9F1LJwF7ON4Cny88k5t+aeshQmk7NHD49
	gzhrkU1TOhfkMHV8U=
X-Received: by 2002:a05:6a00:6ca1:b0:81e:a228:f0cb with SMTP id d2e1a72fcca58-824416f8ee0mr13630302b3a.36.1770719374683;
        Tue, 10 Feb 2026 02:29:34 -0800 (PST)
X-Received: by 2002:a05:6a00:6ca1:b0:81e:a228:f0cb with SMTP id d2e1a72fcca58-824416f8ee0mr13630279b3a.36.1770719374213;
        Tue, 10 Feb 2026 02:29:34 -0800 (PST)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244169ddbasm12302656b3a.25.2026.02.10.02.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:29:33 -0800 (PST)
Message-ID: <845165e6-4595-41de-8cff-d065e8f6b6be@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 18:29:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: qcom: edp: Add eDP phy mode switch support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-3-231882bbf3f1@oss.qualcomm.com>
 <af15838f-6a31-4017-ae5d-7b5e30f24aa4@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <af15838f-6a31-4017-ae5d-7b5e30f24aa4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4NSBTYWx0ZWRfX8v+qx3Za021k
 LFg5jJ2yyo4OHUSn6shggPA6FpGJmF5GGlx4N00/hZiw/Xjgl0t5Heup5Gw8OaUOEEZyRMo9Kvx
 JDDb1tr9hHShDbvQu3UK8zHDG3iaJnxQIZAF9yyeGd2MbK2JDE6uTimjkU5ou4Ipc3l0hp3wpP4
 4hz7zNXH+qr6fJS5HKFrNUCrhyzxb+Srofi0bB+CP74vFnFn4kAiAlPqSWbX70w5Z7Vx2IG5wB2
 grL59/zqEa0vZ5x1CHWnxEWWJGTUyVkPwx7sHyVTvu07A6ubAqPGsGHyFGxFC91w4PNc0YN2XYp
 Sm7ltE21vyH4xNoB8ruai5NcvVrWuAyvR7vq6RBeX1/Q0LTdWGjGFV0d5PG0obrqzP+Eq61U6s3
 K/Hadh/rjvlRKaXpmak1GSZe4AUjpfwGKxCrUT8INhxA2s+vor0t4SXgAXzS3yMTgo0S2ewUW4p
 W2i9JAKtQTO9LMNYWwg==
X-Proofpoint-GUID: 5ss8pKHl3LmiAUO9sgHYeNXlulRWl0Cu
X-Proofpoint-ORIG-GUID: 5ss8pKHl3LmiAUO9sgHYeNXlulRWl0Cu
X-Authority-Analysis: v=2.4 cv=b9u/I9Gx c=1 sm=1 tr=0 ts=698b088f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=z0i2z7H4iVerI-YqTMIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92478-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E19E119A81
X-Rspamd-Action: no action



On 2/6/2026 7:02 PM, Konrad Dybcio wrote:
> On 2/5/26 10:20 AM, Yongxing Mou wrote:
>> Add DP/eDP switch support by splitting the PHY swing/pre-emphasis tables
>> into separate DP and eDP configurations. This allows the driver to select
>> the correct table based on the is_edp flag.
>>
>> Add a dedicated table for the SC7280/glymur platforms, as they are not
>> compatible with the others.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
>> +	{ 0x0b, 0x11, 0x16, 0x1b },
>> +	{ 0x0b, 0x19, 0x1f, 0xff },
>> +	{ 0x18, 0x1f, 0xff, 0xff },
>> +	{ 0x1f, 0xff, 0xff, 0xff }
>> +};
>> +
>> +static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
>> +	{ 0x0c, 0x15, 0x19, 0x1e },
>> +	{ 0x09, 0x14, 0x19, 0xff },
>> +	{ 0x0f, 0x14, 0xff, 0xff },
>> +	{ 0x0d, 0xff, 0xff, 0xff }
>> +};
> 
> This is not quite in line with docs for kodiak. Now, if you have
> better/newer sequences than the HPG, I'm not objecting, but please
> cross-check
> 
> the rest of this patch I think looks fine
> 
> Konrad
Thanks for point that..
 >> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
 >> +	{ 0x0b, 0x11, 0x16, 0x1b },
here should be { 0x06, 0x11, 0x16, 0x1b }, arr[0][1]: 0x0b->0x06
does this looks fine? will check tables again..

