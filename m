Return-Path: <linux-arm-msm+bounces-111678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gcP3ExlYJmqbVAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:50:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A058652EC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:50:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FKO9bkDT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Vxbt5Mv5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111678-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111678-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A18B53002B42
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3487A381B01;
	Mon,  8 Jun 2026 05:50:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A5637C90E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 05:50:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897810; cv=none; b=Jbe/rppBkETzEo6SKuOSPmrE5dL8h4Svy8Eodw1jwipf/FxKagacx00GvovqNqO/ivLBrb79BVuJF1QstlCrDpiqfORqFWh4XweRygyD5Y/eZ9zi5XFcen7mVMgsnPxjzUKcwyGgyq/0ceUaokb+bvMff82oFM3KNNIJEAF8wy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897810; c=relaxed/simple;
	bh=tzYfBQhwfe94++DjT7L7DAHDGuFQ2dENINgETln1HJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReEBo+vGbxQvtmSHbST+2T+X2jvef5K0QdPXr3nkeVJH+5nYt/0aRIw8kF09s/dpMq8sUqZX4zDs1gb58yj7VDCPAubpBFW78vnQkbbWwcfzeOhVXgFodLB3wJNSHLQ0tIxF6JnpHVApB+k8dLjuG4aoxxOuxLNNT4fhBqwkebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKO9bkDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vxbt5Mv5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EB0Q1575134
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 05:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rit6VWdw7gNECggAfevbaVkla2Yc5d08plhz2HlfCfA=; b=FKO9bkDT8wOmyjFe
	U7h/Ws3HXaxlbRzAk7l3PMNdSgrJaEeuXpz6soFHZq8uVP5rPkwjQy9+oRM4CRQb
	lxgGdPCGojTdOXsYEdTZrCoD3adpHtJBEGABKyUCDsmszjVDfUZx1mL+jaW72hkl
	2mGX8LlDwkEXg0m5YX8wIAiKqa8Ino2jDTJOpgQb5UIvQr2SmtH6q+fSwUYj1FNS
	JO8fpXP5bVMy/d5eUPVdw/S9B4kp/Tk82+YwV9afatLx/6YTgcD2mopNDfYdno/e
	agrutxtbIB87YgbypkmH08LMDB+NCrFoQAprMI5SrIFuMrwJeuiMvfH8YwI5vmAa
	JL5nFQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1dyg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:50:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c10cd7df22so49560695ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 22:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897807; x=1781502607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rit6VWdw7gNECggAfevbaVkla2Yc5d08plhz2HlfCfA=;
        b=Vxbt5Mv5QpHNwzLlSG4GpwPDaDWFuesQucsR9t88QJSEZ3uqli+Gqln3kPyOnsl+d2
         v94cDwEB8zOnp9/QM6QpdlH4QLb03mYdtmAse/B5r1tS64fn4i1lm1dgyPdDB+6XQ/V+
         mFqbnfAX6hXDGP8Vg3qcDRF7FxB7caTZhm2VrKoQ6g0psCfOGFD29T3sTKQdR2nifdK4
         ipYLuxzMTSCCxkrpMFfAm4ToMktnENv9QK9WNpKu89ba/R2XKyDXK2ch13sJlV4RqQdS
         FSO2qO2CnLtXds+0g0E3HfKRxRcugC4Iix4qvPrWq2sO/2qL+mr/0FBXrsK/d2DHZ053
         N5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897807; x=1781502607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rit6VWdw7gNECggAfevbaVkla2Yc5d08plhz2HlfCfA=;
        b=ZWygWRQ8YYVWgcMXE8JofDTWfegxVzWI2tWdyp9wOulq3ys0X8Rgk4qs8o6z3luK4z
         IPxcorI1qNqFDadRIKKWi8aAQtnPha/5n0NsvfLQssyfiNE8GgOGCeeyWgb5taHE0iU5
         wyihZq06GDDTSCePRjmhnE5IqpKM2svNDZqsFrLwYWjeXHXuZQnV7f/xz8MqYT1JMoR3
         /g73EFrUNdLbYtbs/QLsf150RZFU5obxXuV7rB+n+rRI27F06PWFF4R45KqNlByy3BKd
         knKQNcvcTLZpOANXqqPHC9ows5WgSvn6AalycAFxXJvfCnzsgcLhjNk16F/I2BUfTc6E
         Pmaw==
X-Forwarded-Encrypted: i=1; AFNElJ/N9/4Rt5Kllh3PUAtxyVjtLuS4ZjqFWAGbWiZBl/uqDihIr4O39IIo8Hk7o+uiRBHdwGMDjfss+psphQ1W@vger.kernel.org
X-Gm-Message-State: AOJu0YyhbUDiSqar9lzkHQu0wLw89Grkb5lTqdSRjza9bp7YEzRzIHhh
	CH+biN/FxpiszR+l8+f4bhTWattir/DWufewptEtvmbBqgwCloQ5MPCq6PaejFk+/Oh/6zOPu+X
	usEa6VCfsh+coO1OK7sHEvBr+lLMlSIf007i0W2t7LIyjCZJiUPt/jKXvi4v+gyJ9/ERI
X-Gm-Gg: Acq92OGujCmsuk746YfE+Jg9MAJuIIb6vL++oUSlwvRJ0UmRn7ukkQM9TPpRTv2Kj+D
	/ghboiIDx6T8x1hhgURZZfN/h9P2O59Y6gfxaXou9On5v/1IIrxH5izizmYYOb6MIMqN0s5W2G6
	nF1MipkxLaECl+rQ5ZeVXTWAPDspVcE3wq7FnqrMArH7MPl0QGdqXDz0K4JZxTeF7hxF1xD1H79
	kPRbB6SlbdeFYvGiVdHCqi0Ln8SEOkDyFYW6itLYmApRJyDObKZWyhiOS7PWrD6LAk8pWrvotGo
	JfiK2FNBZqn2l8X6LF8ZfxBpW++oQvQZtR3WmMxmbWn09rfoqliEe5smUkeYonkmDxrcnz6ioxe
	zvPXnuSgWkUzWlc8nGRnbcTHatXhEYCBHLiqnUNPjYdbg2+vyi2+pK1U=
X-Received: by 2002:a17:903:3b8b:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c1e85ca6b6mr168779115ad.34.1780897807050;
        Sun, 07 Jun 2026 22:50:07 -0700 (PDT)
X-Received: by 2002:a17:903:3b8b:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c1e85ca6b6mr168778875ad.34.1780897806636;
        Sun, 07 Jun 2026 22:50:06 -0700 (PDT)
Received: from [10.152.201.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d45csm225747185ad.14.2026.06.07.22.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:50:06 -0700 (PDT)
Message-ID: <5c24a3f3-a4c0-43ec-9653-bc374a9c5e22@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:20:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] dma: qcom: bam_dma: Fix command element mask field for
 BAM v1.6.0+
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        mani@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        lakshmi.d@oss.qualcomm.com
References: <20260514-bam-fix-v5-1-58f6edb34969@oss.qualcomm.com>
 <agyeh4PZwG0Mu6Wx@vaman> <aiFXPPXtjCHj0Ged@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
In-Reply-To: <aiFXPPXtjCHj0Ged@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MCBTYWx0ZWRfX8xVGfClm61IT
 rP3BaunA8aLgt7CQKiFmUmvqs4sapf9Vh87WkPc0d2XbWWoZIXz9R1B+kTV3N30xDnbdCpSu9RR
 oSQScBWJP+pEZz8i8Lz12aJkSfLBTcnmrBO8rYRxJHLreMyhFuVx++NL/QqhZk3pGj9Y7gdf9iJ
 SGDEqIBtph3+xVxoufN9d5LZr37uYADSAle+dB3w/S27vZ4jkj64P0hbKIbnhCO2w0QzCZ2Z6E1
 W+iu1a/ZI8z6AZjjUcDc/i78NA/ES8Wbk7sIqCAcf52g2KVt5ZR+Rg3QxEQzotnaZ340A0v1eRn
 WfBuUWtf8P7JZ7I2WHSN/wUIcNWdh7TphKhDfiqmVMq+WLrwuXvn/Oe5V77W7d1LrUd1aT14Sih
 TTQZtERPZDpbCtoSluMKvQB1xHdSPKrnkipRC/ubjvTgisjn8kfqcDM7VOCAowEgR5nmcMWm9Gv
 DC5FyzcXcptdRMuh3Qw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a26580f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=L4bHF1UehNEsD6MlcwUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z1bibfVJQYhdAytWhdm1wndm7m33UrJe
X-Proofpoint-GUID: Z1bibfVJQYhdAytWhdm1wndm7m33UrJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111678-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[md.alam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:absahu@codeaurora.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lakshmi.d@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[md.alam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A058652EC5

Hi,

On 6/4/2026 4:15 PM, Varadarajan Narayanan wrote:
> On Tue, May 19, 2026 at 11:01:51PM +0530, Vinod Koul wrote:
>> On 14-05-26, 12:09, Varadarajan Narayanan wrote:
>>> From: Md Sadre Alam <md.alam@oss.qualcomm.com>
>>>
>>> BAM version 1.6.0 and later changed the behavior of the mask field in
>>> command elements for read operations. In newer BAM versions, the mask
>>> field for read commands contains the upper 4 bits of the destination
>>> address to support 36-bit addressing, while for write commands it
>>> continues to function as a traditional write mask.
>>
>> But this changes behaviour for all versions. What happens to folks on older
>> versions, wont this break for them, if not what am I missing

It will not have any impact on older version of BAM controller. Konrad 
also had a similar concern. Please refer to [1]

[1] 
https://lore.kernel.org/linux-arm-msm/2394e63f-1df7-764e-5489-3567065707a1@quicinc.com/

Thanks,
Alam.

