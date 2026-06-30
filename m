Return-Path: <linux-arm-msm+bounces-115450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EN3kK0TJQ2qThwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:48:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5007E6E509C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:48:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=klJIHGzI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UwS84tZS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115450-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115450-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22CC1309FD88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4069A3655CF;
	Tue, 30 Jun 2026 13:47:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0A331ED9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:47:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827259; cv=none; b=JEW7qv54gpkRhofuJ7/A4WMx7pFq1MeUmqyT5oXk1jwgK729ydTbMFcza6gSX23+eno50YuKc5vO+POnRugBEDRAcpPZt4cZf/EjtVNSZuGfz/p1fTa3VTaYzc9FDAra2GCiQ2D/Zt2tzCXF3Hi8/YPZFo8chKX5LolmGnfZ1CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827259; c=relaxed/simple;
	bh=uQcFgZ5PTdj0fysLbhqM5+3zbS6y2ntd2SFx87lCYuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGi0hRLOITZWDDkSo34iBNGFfVX3FjCZ8qL4cwkjAkuG/Kcj7RuMqkaPZGAx2UluTulx1OEeIbytQFtl7ZXlAbVZPCTfH5gH3kPBEheym+Mac+h2RY8WTcyB4R/d1rjbnnMwd7TPdMAyvykPkR0DxqSrx5gC4mG3un//6hg0vDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klJIHGzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwS84tZS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nDKD1542087
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32rvVfYkUGtiT3VzoEyiVTP+jLoTdGjbv7dR7oDUFGY=; b=klJIHGzI+aaf56xY
	nG5oZcDutRX0s6Gh3v8WoJz/9ES31zfODh0ZxYppQHhQb22Bbwah7EN/0m38uhh3
	rAPCYuz6Cen1DQUS2cmm0CxGDKt3rLcqrj+rhA2ebUBkMMDz368siRaUGOH329p0
	/Q4EBo98Pt8lCYn3r8EUuwX6t1xOoVkcqw2FLTdcbXuP35HScwhkxlm8jTnY2BNk
	JXUs2S3gWYW+3NYwiRA3L/EngiXGRpFWiNYvscHtvOMNVJuDmfrp8z23C3Mn3dav
	K/TOdCr91d1ejX4Pv27WlhbSAbwcqZnxMgA8qef1vBV+BRzRO66XXG8E+HVJYewh
	lz0iYg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp2rea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:47:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfd1772d8so4413521cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827252; x=1783432052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32rvVfYkUGtiT3VzoEyiVTP+jLoTdGjbv7dR7oDUFGY=;
        b=UwS84tZS4o1HS1dOKrajcEf2gGfBozLIs236q2BJgFw1l7B36p21FpvRD9EG5f4orA
         7DgboH3VXjjtyKbmAYGC3vTAAGIxro6w3K8OXqLX6m31jqoSKxG1kAjhpQME9Hdl+IkD
         fMXA+jf4/2RaLFvkDlGWCewR/qPw10JizROLPHDVsafxBEI+F1w+PFS+R8FxxXjFGrIO
         tOtOGeZnHe8q90V5JOlyED4UnAdjoeAk7eboCTl1NvbbxhKAHkDzjaO+KgwMIBCnP4r1
         xua4IrpllQPys+J9sxFPJYtEyfwQcwSFZVQPzFlelh5Ay8nZyY2kXTwglkPEykXPwnqW
         bdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827252; x=1783432052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32rvVfYkUGtiT3VzoEyiVTP+jLoTdGjbv7dR7oDUFGY=;
        b=mZXuwbKnTSooGvuLY3gL48l4Aw24Rs+Lp9Fzk7ykAMr6hzaMEcNSFh3JdoG+nIEeBG
         mH7+rDalR0+pcBiYFWSycvMyux0my07D0jcykXw0PEsGnNbTWs1KvfCJq4L/OkQrWQD6
         vz+Hf2r+0N0Zd1y3Ac2eRYEjGBc3WGlUC8OnTAHGVw84qIPrjuoSzcWmopojbMWRWdMc
         c8UrW0uVpGcaOZvR5EEjvoVR1LQksvzAARGRGo74djRSdKztSfJ8IEzp+irG98TItxT4
         w3V5RuTPhlbCy+NFTJIT+qoa9zsz4bPl5ihvYvoG0IG4kCyqwLQRSWAD8B5p6PflPpN0
         WBgw==
X-Forwarded-Encrypted: i=1; AFNElJ+cFKCr24o0lTwpCyrrIx11kx62JFvhLVWMug4VM+hqO+nDdiMm2J5R7niJi7uX3PHyQNd8FaS8RuLsdg0B@vger.kernel.org
X-Gm-Message-State: AOJu0YwiqaA1xxsEOmR/1yOjP9Jmm8XL0BYfm9HEtE5HJOucKwdML4UD
	OdotR0qONBRJ16JEUeIjhAnjfJAmJcPw4bzE98zQvI8hXJz3lG+HY9lodIbmDaq/mUGvpgIJxyT
	9VV9kVSpH5vhlp9d7oDw2XQQklN2qaHXvXLhFsmUOgxCJrdX9mTsezZ5a1hcpQd3bmlfK
X-Gm-Gg: AfdE7cmPriw7UfthjlABrzU4RgLauyMSMfMkYjh4wkRhSS4uwadgWYkDebiOYXmgjDo
	LUc/vmb0obCnzNoRqvihSAdLbOM9aDsGzxuC+qr/StPKJQlW1ycuwOYplZwU8eEP+3awRMbfRwx
	aWYGsk3+w9h3f3UI917OdYdczYk9AKWX7tS+OY0qNoHeCaAFSopSnM0BN7F81DrsQVt8LpTqk+O
	kKa5+DHzGwUfO9OTvF07ppRi1OoOcPVbaQTogmdw5eAap/bM/djC8ci/PPyO6v87dPki0KVBmvb
	1Du4dRW+hjWelV4+umuqrpgTDWI4+uLaAaziAJL+fpWhIUgaAFxX3KvafESrNbP78ICamyNyZGZ
	Wf2pf23V8ep+5DvYhs3KyjePlnFyTLRNEZ6s=
X-Received: by 2002:a05:622a:180f:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c105fd5eamr33252591cf.2.1782827252132;
        Tue, 30 Jun 2026 06:47:32 -0700 (PDT)
X-Received: by 2002:a05:622a:180f:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c105fd5eamr33252211cf.2.1782827251549;
        Tue, 30 Jun 2026 06:47:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc89sm131546966b.36.2026.06.30.06.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:47:30 -0700 (PDT)
Message-ID: <70a3631f-c687-4bdc-a1b1-7fb123e073c8@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:47:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-2-f6d15d7dbbe8@oss.qualcomm.com>
 <7b47ca4e-dc20-4155-881a-b1849cc000c7@oss.qualcomm.com>
 <20260520112159.o2p7gyfnwowhxgfp@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520112159.o2p7gyfnwowhxgfp@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tTQXFsBk50tvOBPEh2sq_nuzAKhx1uzb
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a43c8f5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Iub-jLrIGNqVuaaK_7QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: tTQXFsBk50tvOBPEh2sq_nuzAKhx1uzb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyNyBTYWx0ZWRfX8k9ER1HqDn+6
 FURoCqEyrZea5VfEed26fOtGxh6mF+Lx4T6pmL1hzYq7YQ82xoqeD6IDI855klwMZHwBnCkfm/V
 P78O+0DTt/td3MIVoVjAeGSzumeIQ6dDE9GuhgIDIxvHYTqx9cbY5eWSWwqRbs81/ZQdSupggsR
 oNGEUn2RXG5c+mj9NNjS2qpEjEFwWykem9X4MDnWDBB+XgB2C9L8gKSY6xmN4nMbOxSY5JnDII0
 ZNSgWO1Cttukb1EN5d1pknLisSjbP7uFGXRfq4MGC9omT3KZdMjbROibOARCyqJYfqHApDGjify
 W9yGdSizMgs4fsUoALuIvCQTPTRdWvI0IhTvCmg4nR8QvisnitAgm4m/5Pd5M5cT885FX5DYA+u
 SV4Kiu9FMnCvzQ+k0Bu1LIeDqYnpBDmZgeNivIJ7JSUB0Rv9Txgdh/KWRLC+lHgmj7zXUHODsoJ
 Zv4XaQyhfZ99EXOJlFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyNyBTYWx0ZWRfX7gXwuJXbN1jm
 kNfO1PMaJOyQp4+LZf3FTym1DnMv11nFUTnKoRYcx0VzCa3JLIRdi28C569aX0gY7SlCkRQ0FBZ
 RBQV2A1hwWML/eajOolR7XngeKlfR9Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-115450-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5007E6E509C

On 5/20/26 1:21 PM, Rakesh Kota wrote:
> On Wed, May 20, 2026 at 11:51:49AM +0200, Konrad Dybcio wrote:
>> On 5/20/26 11:07 AM, Rakesh Kota wrote:
>>> The PM4125 PMIC uses a different register layout for USB VBUS control
>>> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
>>> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
>>> a current-limit selector.
>>>
>>> Introduce per-compatible regulator descriptor data to accommodate these
>>> differences. This keeps the existing PM8150B current-limit logic intact
>>> while adding a dedicated voltage-selector path for PM4125.
>>>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> ---
>>>  drivers/regulator/qcom_usb_vbus-regulator.c | 102 ++++++++++++++++++++++++----
>>>  1 file changed, 88 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
>>> index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..3d425452a0b35b35c4b454f84eb28e87cc8ba4f8 100644
>>> --- a/drivers/regulator/qcom_usb_vbus-regulator.c
>>> +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
>>> @@ -20,10 +20,35 @@
>>>  #define OTG_CFG				0x53
>>>  #define OTG_EN_SRC_CFG			BIT(1)
>>>  
>>> +#define PM4125_CMD_OTG			0x50
>>
>> This register is named differently
> Ok, i will update name to PM4125_VBOOST_EN in next version.
>>
>>> +#define PM4125_VBOOST_CFG		0x52
>>> +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
>>> +#define PM4125_OTG_CFG			0x56
>>
>> And so is this one
> update name to PM4125_VBOOST_CFG in next version
>>
>>
>>> +#define PM4125_OTG_EN_SRC_CFG          BIT(0)
>>> +
>>> +struct qcom_usb_vbus_reg_data {
>>> +	u16 cmd_otg;
>>> +	u16 otg_cfg;
>>> +	u8  otg_en_src_cfg;
>>> +	u16 csel_reg;
>>> +	u8 csel_mask;
>>> +	const unsigned int *curr_table;
>>> +	unsigned int n_current_limits;
>>> +	u16 vsel_reg;
>>> +	u8 vsel_mask;
>>> +	const unsigned int *volt_table;
>>> +	unsigned int n_voltages;
>>> +	const struct regulator_ops *ops;
>>> +};
>>
>> And because they're so different, keeping them in a single driver starts to
>> look a little odd
> 
> You are right, they differ in control mechanism — one uses current
> control and the other uses voltage control for VBUS in host mode.
> Since the functional purpose is the same (VBUS regulation in host
> mode), I felt a single driver made sense to avoid code duplication.
> 
> But open to suggestions — should I split this into separate drivers
> or is there a better way to handle this cleanly?
>>
>>> +
>>>  static const unsigned int curr_table[] = {
>>>  	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
>>>  };
>>
>> And I think there's current-limiting on this PMIC too, except in a differnt
>> peripheral (@1300)
>>
> The @1300 peripheral is for ICL (Input Current Limit) in device mode
> charging — not for host mode VBUS regulation.
> 
> Could you share the register you're referring to for further clarity?

I think I looked at ICL_OPTIONS (+0x50) and ICL_CFG (+0x52), but yeah,
it seems like I mistook the two kinds of currents at play.

Konrad

