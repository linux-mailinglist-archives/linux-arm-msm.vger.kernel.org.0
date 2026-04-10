Return-Path: <linux-arm-msm+bounces-102587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OQ4MAfOM2GmMfAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:38:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3863D2571
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D632D300C039
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A60339B41;
	Fri, 10 Apr 2026 05:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANTKfXoU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLoTc9PH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB75332634
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775799536; cv=none; b=AsOMiljoBzeYgZnU6uZglo8cRmFDIqam1xUqEkpmB5hWSkH1I0n+qjWgbZ5sArFZnBUoQxaAM5ZYAqspBsus7lJTcv/Im4UEaeEtUWQ8VZlgEvUmL0GItfUTtBhe45T0Y49+7dR++ExLBojOWvNNTjxIH/YkP8pKomQvByF6KM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775799536; c=relaxed/simple;
	bh=LCW4faW9nVqAL8dVTUuUS++lxPB3RzrvN4pI/NADuMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=js9/4BZ4xh63gYbepSkwy0RgOWK5cgRrPrsPuzTQuJtWsI5/qfqJSi9o7qYodAoEE7d8ucTYZdk9kso3wN2h3TLlGt+DSRfpS+UkkaQL73QgyD3RFhx1yzMwfypQh9SZsLV3A2oF7FWnP9uyKRnjPiHyA8pwut2Jv/Yp17PbazQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANTKfXoU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLoTc9PH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639LrKVo3934926
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdha/huLgOL97mCdIIibckuCXn8YgEADP1bOWfW0NnM=; b=ANTKfXoUDjTa3GiV
	TkLZaHVSxEYEt/RtjxZhYtZCae4eOGEaoHIF92JWoTrdTQAyzv5kCxdDoC352XiA
	Rej3rLSXCGMD+lvpY+B2dyP1ZlJx8P7keKgle6FQ9WH5lwQUQ6BCP7/H5j1TsKij
	mW5Gwk4RmrHah0hrYrBK+pMw9cQmt0tMSfNMzCU6V7eOI3AHQysMAeDOv52heUsC
	X60zSYNw+SlVRLv1ffIQZUF90MllJ+4pT65Inj+DC3uRWfiVm1i78ZhjwUrrxgCL
	XVNYEM/zL5F7YhvROuGKl2FZlq1AZ7X1DaPuj9ysAXfkMMgpvWWil3Wv9VWTbwxH
	gNeymw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sapc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:38:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76fede6ccdso1029099a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 22:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775799533; x=1776404333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bdha/huLgOL97mCdIIibckuCXn8YgEADP1bOWfW0NnM=;
        b=JLoTc9PHFp2LLf6o1kVkwIjc6DdNRq7VcWNJKtw+P1S/Sp+e2SU7mHdsFKwi2Bd5rv
         0u65qFXblSBDMo55Vip/+8HHIT9hDSnKz7T5iTcTvo5GCuTboi9jNJKI5YHaO9HsGm4r
         2boMhLij7kn4OBFSIzTp7tRTJ/1K2lJFJ2a4FZ7dHW2YyOOHuTMv4cKPQzD+cFALgHnF
         znSVoXNC5DG5w1+XQYOtVeaaSV1FE7BYZCvFL1ToyxTxkIAnJ5khURB2NywHJ1EytH6N
         gJlF+YHj+uwBJJ77FqGPXpY90ArD6LoxwO01g5hCb+QiKePmieoF//8jY0Xajb94zrrT
         cZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775799533; x=1776404333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdha/huLgOL97mCdIIibckuCXn8YgEADP1bOWfW0NnM=;
        b=raXJ2WZ0rAPwJxSK017hFfRf5fQz8ARUeh8iWzLgmcqckfznKv12X3vgEGyuQHatPk
         WFX5qkFbPyK3P9qHXKrNhydNAtJpfkxu67KwEYf/ImSrrsnsSNClD3ZseXmv5pgdJGgk
         4p2VivoZDBngFRYOxPWOo10kxcnl4a3NhCaQRf4oXdilqL0Lwir0RPp/8VjcZoypZ9tM
         PaDYqgeJq2C5cfCu5GoCWmTlQK1z2JSSeXMXRf+rNHa9DM7/q6QQNLEnWiqls8SKYAB/
         VpSbb3l21/aPn3HnrwK21gEuqrl9NmQ6yGRxFHJDd3y0aAxYYLhC21KFG8giIfFVTNOU
         uO0g==
X-Gm-Message-State: AOJu0Yw6msPR/pe4TlHnP37b1p0a6Nur5+BGDggN5t5Y3QCCuuymP2vx
	/XLADLwXoFHx9LVujMbWytisNBFyoGFHAddom0X1iTVjU1je4ezFdSihOsVJThYUOyA4yLNBL8v
	x2gEfFDOyTBS8L7qXxbAaEJChjzIuxlMC9O5xE/5uhwM+txRSopAjgg5YspFax0Y6NkVk
X-Gm-Gg: AeBDieuAGp4lLhnflRWwjwOWA+KfbnXhqdoc66gOsceTHRPSv6mScaoPECqkCAa8shi
	vKEQZEPAPrMnEcy1qvHc8P4yr2JhizFcV0RAfotyJMcjKBnywCSFfNE5+IrIhk5Hfw4HToh5s/8
	YLaZ3InT987xbtwZfaVneLh5NhaMvvk4xt48R5oQ0qkzSVCLRFbnHiUWDzjCmp2EZXbejnliij1
	bee7UQEADEH1RktTvT0rOs41QavEvunJul3iVAjz+WoDiE74EftPWy7xqVkaIoWmK6DF0YPVUCD
	nkd5FpAwkNEoWKTa5RIhuhJTucmOneIrQJK2K1rqal6C/Wam+OeIWOq3Mr4SAfUB50ic8hhg/Hb
	bpyd+u7YDxqekgLmJdWTR4riIXr5L+2YVNpFQzNlSo/nx5g==
X-Received: by 2002:a05:6a00:4b0b:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82f0c2278e7mr2077428b3a.23.1775799532784;
        Thu, 09 Apr 2026 22:38:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0b:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82f0c2278e7mr2077404b3a.23.1775799532254;
        Thu, 09 Apr 2026 22:38:52 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c500415sm1372404b3a.51.2026.04.09.22.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 22:38:51 -0700 (PDT)
Message-ID: <1c203ea9-c674-43b6-a2e5-87054a9e3b83@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402070854.2804291-1-karthik.s@oss.qualcomm.com>
 <4d08f16e-856a-46ae-8a41-334ec4d32952@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <4d08f16e-856a-46ae-8a41-334ec4d32952@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4bbaceWhDj8DG5n6qgtuFaEtcuxleGKa
X-Proofpoint-GUID: 4bbaceWhDj8DG5n6qgtuFaEtcuxleGKa
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d88ced cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SEM4ifAqo57pbrxDZScA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA0OSBTYWx0ZWRfX73UZQU1FGOPW
 pqmU18M3HRBtAlVSof5Lwsy+ND0AvRDkkg0fpn1f6/XtklSJlwCpuvwKgWvChkW4yj/XWdMBo3H
 SPPXLfpKak68WIkoiUKuukHbeGyQTsoSzqire1kD4TouyD/alYtogDH/GQNMAnp70k40/Q12uxb
 pW/Yc3gV2gPlQRnWhWboqthyyNygeooV+v5z62buYyVfSQMh4kKiUyexGRh9JAvC2u3uTfdyUYl
 vF6aHnt592rRYpK5ymm7uUgRV1xXpKWYTCEnhkXx1A1LZfW3qLs8YSBA4LURZkqJnP+6PAYl2hW
 EIlAFdYkLkbsp+XIiSZAPsnZBWpgiYfZYQCWk0kun4YumAC0GT0xx8W/msQbLXww9OLmbB5SxZc
 43HRZMHvxrN5RPJsJRzSQ0dA3PbNrna9bxlXcB4xeEztn8rGK9k5rTi5KCJX8Gh+lMqeEuC8LQp
 FL/DBtvu5EnsWqnia/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100049
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102587-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,user.name:url];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karthik.s@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A3863D2571
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi @Krzysztof,

On 4/2/2026 12:43 PM, Krzysztof Kozlowski wrote:
> On 02/04/2026 09:08, karthik.s wrote:
>> Add has_always_on_supplies for managing regulators. Indicates that
>> the codec supply regulators are always enabled by the system and
>> must not be requested or enabled by the codec driver.
>>
>> Signed-off-by: karthik.s<karthik.s@oss.qualcomm.com>
> Please configure your Git.
> 

I have configured Git as you suggested :
user.name = Karthik S
user.email = karthik.s@oss.qualcomm.com

>> ---
>>   .../devicetree/bindings/sound/qcom,wcd937x.yaml     |  6 ++++++
>>   sound/soc/codecs/wcd937x.c                          | 13 +++++++++----
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 

I have run the scripts/checkpatch.pl and fixed all warnings/errors 
indicated.


>>   2 files changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>> index f94203798f24..d89fff1f7171 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>> @@ -28,6 +28,12 @@ properties:
>>     vdd-px-supply:
>>       description: A reference to the 1.8V I/O supply
>>   
>> +  qcom,always-on-supply:
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.

Current description in dt-binding:
Indicates that the codec supply regulators are always enabled by the 
system and must not be requested or enabled by the codec driver.

new description in dt-binding:
implies that the codec supply Vdd is on always on rails off the 
board/hardware and must not be requested or enabled by the codec driver.

please let us know if you are okay with above changes

Thanks and Regards,
Karthik S


