Return-Path: <linux-arm-msm+bounces-91810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULmiCOZLg2n4kwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 14:38:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AFAE690F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 14:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34643305E982
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 13:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B133F24501B;
	Wed,  4 Feb 2026 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLlLNMEF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqeDquIN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A98C288B8
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211939; cv=none; b=iTB51Ok+n6GOtSTP8sd+XNA+45GoxqfS2J1cVPYGQts9QKrCp9W5F74Nj/qoZ07qzPwFLTqFN9hGLPZje291GTcvIYvk77Vl96489jD3sdecV5GSy4tCVS4fqsYlfjmandaJyGnpzsXZp0dvTem2/CJprZKB4zDbwcwOQD1dyZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211939; c=relaxed/simple;
	bh=HcTWAhh1mvgjjUz+nRDCm5PRVqTkbfLeEUVVtcHCzYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ub3xcuqqfmSW+I2VThBk/2CXgGhuCYvEEi9FSB/DYuWJEMw83Aem3FWmjgguXlz59G1jXjPV0wuK+KBVwJM0hVw+AJKZONRyWrkXfdeDOyDJDJhAwEe+9EKCcEj/Ysl880vnN77CcNDmYxfgVXoM8DpsNUpol4SiY594ijEA5XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLlLNMEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqeDquIN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIaeI1401973
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 13:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fYX7+EnbUCJtkjdI95FfFpM0C+3s3VU0VK8ZtVbBcWg=; b=RLlLNMEF+b/USLhT
	CTHXg2IwVZyJ9UjBD0zjxzyURUuoNod9P3MDooI8vTMDpf5r+5+m6q78RcxSomen
	6zMQd2k575HAh4kmwSyw+C4r/YFY2saFsE75KI/KIVOACHfDYob1seEasmpOCsVU
	OrNpuIw/T5SFbTZPDuMmOfhN/M1Kizlk6Bg8T4W4CmlM/uYErZXMMhIws6+MSOks
	YM01tnRJU1NESIdYvnQVcg1ECEyq+StaqQotXIwxx0MOYk9TrSXpGHgKGgxZqJDJ
	cW4wzK06lt88K9TJy9VJqlM5HxPCOXIr57KixPri+5hVROfNfMUIHLzmzUZVTyTq
	bt5mcw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43dh0ny4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 13:32:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a26989018so20867046d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770211938; x=1770816738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fYX7+EnbUCJtkjdI95FfFpM0C+3s3VU0VK8ZtVbBcWg=;
        b=LqeDquINXI0FcEj2d7WcRBel4UCa27NCr4zowX+0RL9hbnf0mPvRQEPzzhPD4zcTQf
         6UcPhuGBIlAe2EJLi5k4sIprZOqF0y47DdPu+6bQ9a7N5lRjXM9TU6ezWbqbeJ8IrQQP
         w4BUyP/jtf+jZck8xKJZfHiWiFvEsQeJMt4t7XRUTNglT4M9cPJZmuIuOJoBkIhW2eMu
         nx7IKw7ShYNA99oiJY7sJJ68ZIsOdTp5kBQfoOmkzE7Dlp+sw9D1xZoqBkfcHFU/jiSl
         DeWK8CSfZ0N5K81FekjGVwVDuUG+YJqqNn7OZ62BOD9ICpKcsYQlyoL03HFwvQdHG/mK
         kZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211938; x=1770816738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYX7+EnbUCJtkjdI95FfFpM0C+3s3VU0VK8ZtVbBcWg=;
        b=i3vwzi92aAHGTeS8srTxWdGx/0qNVBRCnSDvFKlzzTaB5+7OeidJHp8rUkXRPB3gBe
         ROzkhhc46a6wl1Nvx2oe2nKb1eMAayGLxiqKeaCworOpgerwbcax1OOICRY/9nUi0nwU
         noYn6CHOJIG1aeMSElAwz6x1DA7+EpJcwfeAId9Uqbf8iP1SL7K5KLEX23AEkpaMgk/E
         QDOgjOUK+jmam7gOFg/IP0Lq18/c88zvcpWXsfjwSEgrwi8wNPM5K+2UsFpr/84cgDBP
         aFBR5HHtFGbkhRDdSI6D2ZCHs56lD7m6F3g612ojxwbaOtZ92biFdnF/d9slNY67gLpq
         wq9Q==
X-Gm-Message-State: AOJu0YygYDERCSCw+fSd9egANQa5IQcUE3G7fmpdYUeeJTnhdBSpzM7x
	K/UEARJZyKnsePy+SP8iafktaplycSaaBOD+s3n0egzsAR5N6wMDNFJncnQ1VIB1vA7epL2KLnI
	tVY9OvPxPi0ESTfo9G7dvGtwBv0MLW6sKXj4Kn+NQ+9hNrcKI0Notty1NtS//xiN0kEu/
X-Gm-Gg: AZuq6aJHoKcjL9T4mN6VGPf6fQmChegjJBJbKUrvsUgQAXZFNjPW8+qtR+gdqvIPulO
	f6eBzc8t1/AwUBLhsKONRntAVbqFNEgaQsuQIZeWclq1GqiaK1fvm2d+AVKozfkTenNQGA2b4EO
	yYO9pEbPbcQTR4Ct2coZsHbSsPflrru92fTO4Z5DZVYybyX7JicEkOacwRfJ3alVfxMEYs9Smgx
	DuAB2BuU1VfW9Vv2F5cBg9w1VEvovFqe4yUxl2pcsy8i4jRFLwuwBEBJp6KoySJJNreXcw1wNvl
	BbC493A3RHXjiep5qSHvygH7u6Keu4y9HkoZr8UTwXDlt30I1g+jppG16jQaYps9Mq7qJZ1NHDr
	kuJBrwsxsZxuBhD+te5J7JMw71T3EVhcLGAwf8jHMTkJwPag8nE7D0FSHy1YuUxPISA4=
X-Received: by 2002:a05:620a:4611:b0:8c9:eb47:6e9e with SMTP id af79cd13be357-8ca2f82cf1cmr290391485a.2.1770211937510;
        Wed, 04 Feb 2026 05:32:17 -0800 (PST)
X-Received: by 2002:a05:620a:4611:b0:8c9:eb47:6e9e with SMTP id af79cd13be357-8ca2f82cf1cmr290388185a.2.1770211937043;
        Wed, 04 Feb 2026 05:32:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0057dd1sm128076166b.65.2026.02.04.05.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:32:16 -0800 (PST)
Message-ID: <83ecc8e5-cede-497e-a8e6-be09fbb17ddf@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 14:32:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] usb: misc: qcom_eud: fix virtual attach/detach
 event handling
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-8-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126233830.2193816-8-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bMgb4f+Z c=1 sm=1 tr=0 ts=69834a62 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=R8DfzrC3Ju-ZMmEh4gsA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: jD9TFJc0wsngaKOCra5pxcp1LBnRy56_
X-Proofpoint-GUID: jD9TFJc0wsngaKOCra5pxcp1LBnRy56_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEwMyBTYWx0ZWRfX62iHyqkfDd+h
 v5qx7lK+4+5ORs5j9yzC3hsfv0FD1sw2xoZR2TqCyvU5kOWxCGonZiOU+VNioeRYmE5iTXxoB/D
 ocGJau2R4npNyZa55v0b+/GCccBXdfx+NDW8w+9g4YFw3xpBhIR/EPm4NuZDcmv5nmGFat/PiUm
 CJ+EwIBKyF61bq1NoH05svcLOguwzxFYIon8VJP5cEM6hWGIXfd9nRYYRWGXUJyooY/CVY0wLq3
 36YkG3cK9fRDiCDN06kXV4BmLtKp1khXarnAerXDuqTz5kwRWOCTtKYbd10ROK8lcuT1BcP1AxF
 2x4014MefAMy4jwmNJSnkiKWUVRxrj0WgAASzAMIgF9oTzAbioCpgQwjaAES1x7zpJgYWknORJm
 7jnGNmpHXoUGkHwLUtXOiu7TiL/UIdf13p7B9q98sUpyzat979DfuVloarcHlG8u31Sg6R9FU1s
 6icLed/HnogG/wLxLgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040103
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91810-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94AFAE690F
X-Rspamd-Action: no action

On 1/27/26 12:38 AM, Elson Serrao wrote:
> EUD provides virtual USB attach/detach events to simulate cable
> plug/unplug while maintaining the physical debug connection. However,
> the current implementation incorrectly sets the USB role to HOST on
> virtual detach, which doesn't represent the disconnected state.
> 
> Fix the virtual detach handling by setting the USB role to NONE
> instead of HOST, correctly representing the disconnected state.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

