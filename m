Return-Path: <linux-arm-msm+bounces-107333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJCLNVyEBGqILAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:02:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB7534984
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EED2830419D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F152BE7B6;
	Wed, 13 May 2026 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hB+IK0YD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHVgwb09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E73258CD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680388; cv=none; b=MdZvstARlV+Nqk1WMv5DqUGj3AQeF7aFPAPqOJ93oHDQ7pUCPPgJUrl1VHl3ivL4jy/6ISRLx4pD+5H6M9jdwXGNMjh9ZV776u/Oec4hSDeaLpVQMYOPIIpCC0KCFCc1TaRqcfnFIaiZAZqpZFm0q2R5FfBxUjdmM3ebUHIZM3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680388; c=relaxed/simple;
	bh=NW38LsgiT7UvdJ0bfcz8nhSrV5n+V2HOhggvZuGzABU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNwHzIXk809vfhs1mq0vbfGrwc8q+H71AQAs6J1ICmK+HaJpYqUR2aDpad1iAl95YW5qkmM1JmdhFcgeavBcD3wBP0pKFA9Z31x+n9m2FSqh/wUcA4RzpEUAP3k5z6WSCnpwYi3vSHdltoORgaUrZ7pPGDmlKzEwKiT3yVXSC8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hB+IK0YD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHVgwb09; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCc0182965290
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rVrZf8kyIFbprBSIHdEsfjI4psinDjxG1i+sxAY0d9s=; b=hB+IK0YD1AvD1+up
	4RTNBUaYGXn0NWiubFq4fyBcDjcvaQVA3z3izrJeIU1z9DY8iFQuuiB/Lq29XlGv
	VV1J54pNHKJIryTCwMEaGJjy554ywIPRWICxFIHPs3hVmuSXhICztYHa5dcRxR/d
	c6fcgkvZKD+A2SaNKzMk+UzxZMcyNW2tfrY7/ac18uX8ezegWNEgp6HHx45DcCl8
	nAhq3qSa1dxIhDnPFpdSMrFCV//Tz36wv0mdTadYxTKVTJQ+qw0nq5RKwysciYrP
	3B7adUY8YTYOQlwm1oJtHfcLDfWCopkBG3AoBJoy+AUEXmAfjGjPOzioy0XDJ4N7
	mKvvdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59meh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:53:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baedd2fd43so42179815ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680385; x=1779285185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rVrZf8kyIFbprBSIHdEsfjI4psinDjxG1i+sxAY0d9s=;
        b=eHVgwb09Wihl9UpOzptK0sLJd+XcOYLL/Oq3/L0+SRV9vTGZ1Im2HQpnUNYdk6Z2OC
         lgwqE3TXmxsqxDZnAsjQEdhh3WEtOAkhqZOmyv5L1w/DbXrB0ol1blke8jC/R3vUqUbM
         Z1NyXhdvRaKAyFgwMngovLgDuI+wrPkpDEsxBZyekzvDrzxDZRpUJTTLGRTZjn43YDOU
         vM+Dcec+2NKhO45E3GZRqJWzuq6avKEP9QZQUOzWA+n3nUyNYEg6Y6yx2hpUgi3tx1YO
         8ntJ23Rcze1ugsQf7Jh7FgcADOeFsTu0W276avT4EaKAF6yF96WmmScC/uRuxYqkGGrQ
         XfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680385; x=1779285185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVrZf8kyIFbprBSIHdEsfjI4psinDjxG1i+sxAY0d9s=;
        b=j0LQdZ3hosfiiq6webwmjGBHbfd0oKTv35lrMkMY/z2MzFgLXv0lUZ54loD9RiIFtF
         moD4TKtYlfeUWei1xnno4X4Xqh1OraBOLvAV9fuITM70Lox/LKC3AWOJtei3op6i7zfG
         Oy/zsc3L46fh2j0BRRpFniTdGjoRxov27yRGaXs3eMRJewQjZCi/WoAFUDBxFI4ODhHx
         tpbti9QWXdgDGqULuAM5giDE+GCZ3ngS6zVs1gtWE7Ag974LmDGssHX84e5SUwXxXLW8
         NxCZ0zVyRoaOpkWkubIf/TnULV2qO+QwLqrsBC0xrkTPiuqdGFCiD8azjVl+fC1K6LUL
         TROA==
X-Forwarded-Encrypted: i=1; AFNElJ8R2ueXlW41viewN0VhIqdLWlOmGT/JZvB97TClnGPRMc6Iagw4iSKOwIz+YP4zwTC3CBVBjj0c81YOqogb@vger.kernel.org
X-Gm-Message-State: AOJu0YysfnnEBDM5lyZKmrgaAO0A8z8oKzJU85AF4ceM/ztzrj6VQULH
	zfhdp5xESM/MqPL6P6tVHc0pIPGZ+0lO9dZhrxjBUAoT7U+fKnUBai2++G2Iae7Bnoe6j6hAIm/
	W4ftAmBXG0mvVxymSbBh/pJpO5VxltzUB+vyld89BfRWuvQImijxV1mNoXSRX8upY2yi2
X-Gm-Gg: Acq92OG6jqUi2mG/7Ag631ILfNZJhDVhMhQpEK9PFO85AHS3bUkrKZZH/Kr7//JF4yb
	eLoqZ/2zBBT1CzrUyii+lF7D9h5StFqw9Y0AnBULhoe0zxiUvwJksqBB2giq75RyjI0YRQzon6m
	yJ9Jyo8r5pbeLdWDEJ0DOJv6EQVGMZY1+lBo3mOOjzZb4aSnaiffuINbPnmq5tjjEla+N5X9IVU
	ZmfNEF1QaYoRHXcgvgE5sg90EnW3xCjp3Ya9DI3TVEsFbyszf/vvYT0Wxkog/lXiZ6qwK6LfvXN
	M1ZP8JEGJEzZ1I34b7mVd8E7gPJV9KLXCmMiVNr/YqKo7IqnjRrxQfPAwJIFBo4xBYrMe5Z3kPz
	WcayiaqwGUtAn7BaeHsEfbF87AepviiJzaYaVwKWhNv6pvVVXeA==
X-Received: by 2002:a17:903:1b4f:b0:2b0:9c2b:641d with SMTP id d9443c01a7336-2bd2f4dbc06mr33316925ad.2.1778680384735;
        Wed, 13 May 2026 06:53:04 -0700 (PDT)
X-Received: by 2002:a17:903:1b4f:b0:2b0:9c2b:641d with SMTP id d9443c01a7336-2bd2f4dbc06mr33316415ad.2.1778680384176;
        Wed, 13 May 2026 06:53:04 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm172503375ad.28.2026.05.13.06.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:53:03 -0700 (PDT)
Message-ID: <80abe8fb-cf89-45d4-8bf2-1f448b1812d8@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:23:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on LPASS LPI SoCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260513122542.3726319-1-ajay.nandam@oss.qualcomm.com>
 <a2x5hg7uuok6pfeyfaoq7ym4ffekgmfgbnpmninkmdugwf2b6l@tb5mhs2xuo6e>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <a2x5hg7uuok6pfeyfaoq7ym4ffekgmfgbnpmninkmdugwf2b6l@tb5mhs2xuo6e>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfXwADEA1MGlKSJ
 GRTV7YEtSMGGc4TGKpqw+0U1kuHbG4/z7U8fFk1Cr9yKvdkdX9FE9lNu4E7+jGMRvxUbZrfB3De
 4YrTKxfMsPwsf82bLF3orWDznphO94P9rT/HHjoN5ko5dpoIrSNkU0806eAY1WdFKz2mps8PToF
 IsQZsqZzsmrDlmpzw7OQf2Jb77Gx3E4SAFYH9p/YQcXWX4ofE4arKtOl/mUEPiAT4lErjH48P97
 xEN67m96NO0oMpUTfTpu8TFKVjbfgAsx5lsCV9sM1kBMqP3ht88XfQYK2UFxG9UknsjpNvR0KHz
 thvkXz6ln1CkRQFPRI9QfULYK9OeXu3wv+cDA7plLdlMVNZsnR/6zgS/ZKDbw8rTFqGIizVXzyn
 JHQMBcAeECjvHUGBlsu4ozp0FWFszmT6A0cxnYrM9D5MG9ni+3Pw2gG2y36Frgea1ZpDCYX3uLN
 y2ITtQBnKeVMH5IxNmQ==
X-Proofpoint-ORIG-GUID: 5LOpcNNfow1aMUQDwKv8fWm9JDCKPUF5
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a048241 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vaZE88RKOnRKHvq5_igA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5LOpcNNfow1aMUQDwKv8fWm9JDCKPUF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142
X-Rspamd-Queue-Id: 15DB7534984
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107333-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/13/2026 6:21 PM, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 05:55:25PM +0530, Ajay Kumar Nandam wrote:
>> The LPASS LPI core conversion to PM clock framework relies on variant
>> drivers wiring runtime PM callbacks.
>>
>> Hook up runtime PM callbacks for the LPASS LPI variant drivers touched
>> in this patch so they are prepared for the shared core conversion.
>> sc7280 wiring is completed in the following patch.
>>
>> This commit is a preparatory NOP on its own, as runtime PM is still
>> disabled on these devices until the following core conversion patch.
>>
>> This is a mechanical per-variant driver update that relies on the
>> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
>> pm_clk_resume()) and DT-provided clocks.
>>
>> Runtime behavior was validated on Kodiak (sc7280).
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 +++++++++--
>>   10 files changed, 80 insertions(+), 10 deletions(-)
> 
> Please don't send new iterations of the patches in reply to the previous
> thread. You also didn't send the cover letter, making it harder to
> track the changes. Please switch to the b4 tool.
> 

  Thanks for pointing this out.
  I resent as a proper standalone v5 series with a 0/2 cover letter;

Thanks
Ajay Kumar

> 




