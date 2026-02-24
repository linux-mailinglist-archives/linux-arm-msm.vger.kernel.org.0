Return-Path: <linux-arm-msm+bounces-93976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLiBCIeRnWlKQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:54:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75115186A33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7A5131368A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6626237C111;
	Tue, 24 Feb 2026 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4EJ/K0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eJpG6mWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480DD37F759
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933715; cv=none; b=nwZFppsZfc6QC8gRVD7PtvDnE/v7Btd6adGwpZpi/CYi6rUWO0yRE3IoKEoWiC7ke4HzJ5IqYz+72FSARNPjP797InhJD9hV3wslRfSvvkwNh0GHQcUl7tv/nw7e3KpAohD4lh2xCyv4F18HsTdoULIL4J/I6iidTtHjH5n5e3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933715; c=relaxed/simple;
	bh=0v6pvTlJvcG9+r5fugc483xRtf7llEy1Pb21ln+tXV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FhTrY8OljQBNHzJYuKJCziVj4rqaTHmfN1ykq52sMOqs+0jARK/KOSX0NeIwgH+BIMfk+niwATsVaIUtu60mGM96yP7kmQAWgxRhgonXP3Kazpv2SgyIsyqXav/YCMaAxnz/g3Gn9E5LLMOrD36wACneoKrIm/aToahI2LS8zw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4EJ/K0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJpG6mWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFc722774722
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xH1E6DzzMr3/xcCAQ2jtTC36E+qRKswe0p9EnplcO8A=; b=O4EJ/K0IudBMeE7x
	n4zu0ajhY6HbHLjsIB5e8PpNa2sbzDZdEFWyjoPs9jGZx1gvYUoitLUlFMl5QvvW
	8uzOQkWLY4TNopcUY9xBQypCHAwWKVi+dxxGg0tqPc3R/F1POWiqJXshqh4Fau3E
	71wo+NYJ1CS/fv7Ev9Q0yJIGfW64A+qjAEbqX7EvhPGvHEF3hKquFKDmJQ6Cvy2E
	2Vv0xeRp463XFDu6k6Iy3laglvOlvDYHG7YFnALiuDvSwxIu5ZmZw7+vQUgAwvtl
	VHcmLJGV/lxjPoFQCsc3zhLi+A48gYJT6sP3PcFeR1/l2Izagt6aWRkbo+Yldpub
	/MWtVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69khpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:48:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38a5dc3cso542548885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771933712; x=1772538512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xH1E6DzzMr3/xcCAQ2jtTC36E+qRKswe0p9EnplcO8A=;
        b=eJpG6mWj2XkZLBfgIYeqhV9A3eYqbsIf85DPE8jqvbUwY8fmrIKG1yaH9XBair76EV
         YSmhXewGp/FYKvDXHNtYyl+koUNhdiST3U8i3Z8Br7FFJ553G9xJFfqfOUl5T1wMEfiA
         LKsv78bcFFso4ghSEeCqTTiZmf4jAl18YjkB1R7aoGBkwrb07mHl+xYizUmtpzjimqjb
         1RrUrLi5Po/lMpBv1jlEzk0YuAOkLMDc9jPf3WJ7vdOz3w2H04l9xCE8B4jHi9Z1CwzI
         BKcvzwd6Zg1xEsvoYgf0jL8B5rOD+5mLl85PEc+wGCUBv3CGn3yGV/BJcQJdQMhJz46n
         aooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933712; x=1772538512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xH1E6DzzMr3/xcCAQ2jtTC36E+qRKswe0p9EnplcO8A=;
        b=NL/crOah/J6ZVQa4jHP1ZMXzSdcopmuyR6UyRNH0yQAjxLfYLdsVMNOu/hYRzHPncx
         tx8B75I6MkWfT0RT6UAtkd9QUtIS5MmIZvGAYw0Mnk8I1ngfsf0cE2uqb6B7CNNN7RKD
         oO5TmEjkLhxVFQNU/eWvc2ElYGstXcmB/9woWFq+Hw/WVYcsxSS/VlYM9mh5t2lliu9f
         jtwmjRYh3Volo6WuBAZJwyuavf12lsD3rJIGZDlUqdQlvkbZGZS7MNPKwjQgE0fvo5ZF
         T4ODNmdMk7epg9PecC+bH/+f65FJDvdcTIkUQ3jjyaMYUtNS5lA95pYz6QZyxJt87mfE
         AMRQ==
X-Gm-Message-State: AOJu0Yzden+af1F5b2LbdwOGJrs3rb2pUm8sRtKQob0DGtFja/607yOW
	qhcvbEz8q13XHVQJ20jFeqybfi4UI7TqZTA5qwpwz6OyRsi1lWsHzvOSPI57AmNeKcuasUBEsQV
	13jkBaNY4XpCCSlIyAZi87EJ/DiQtCr4NZ65qkDwREX1sXHarh9YejiikgAl6eSpUuSzb
X-Gm-Gg: AZuq6aL/CV2oPRZ5pBpovDkntntc93DJiaRd4KOvG+cLOV7bZZ1fveF6QBpIsUdAXQ+
	mmp/yPwsptlLoF9HJu49F1U1cCpHzdfgA6OYk0VwbKKV3hy3GHXZy8WgFczOoDDv7/tlg8dxDoz
	Pp0DmEPtkXK+w+rBC72LJpKe3rBNmAuRQiUuJsmOKRbhsf04pFNtYd/hiP9odalpL0B8+69DzkL
	0rZfogYZup62tfkxbqBihXxoulwxq3l850kLzvsf6wv1I2wEhYS7DQqbq6RULpW3l4frzbGcp4R
	ubA+B2Re/tEW86gK34f3SdTAIJ5/C0LE5FQaYvMAzqNBZflMgIAnUnc4OX6jxlB0yw5z4qb6XFZ
	uM8xGQYJYHUF1vlr/jeVlYpBld+rO8hN/spDbD5QkFvtPFIXv0TLafbtnZtmB6pcX9d1g4v4pLE
	dOAyE=
X-Received: by 2002:a05:620a:3708:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cb8ca7cf28mr1109027085a.8.1771933712612;
        Tue, 24 Feb 2026 03:48:32 -0800 (PST)
X-Received: by 2002:a05:620a:3708:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cb8ca7cf28mr1109025085a.8.1771933712213;
        Tue, 24 Feb 2026 03:48:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eaba138ccsm3414681a12.17.2026.02.24.03.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 03:48:31 -0800 (PST)
Message-ID: <2819778e-3303-4993-b8d3-04233831e14b@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 12:48:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: arduino-imola: add support for sound
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223133950.221234-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699d9011 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VAOo7bAQqRyDQ9SCnccA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9VegTQ98AgI894hKXVoTaa6abdSGFvsr
X-Proofpoint-GUID: 9VegTQ98AgI894hKXVoTaa6abdSGFvsr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA5MyBTYWx0ZWRfX8AukrnFL2jjG
 mSx6UfYd3ZcXa+K8Ei2p9HuWUKmpiCAMkm3II+3M96CgBxhBAc+dsuIZ1uZbzFz+6AzsnKTajQm
 8JgveIq3use3kYSXPB8ju2LZQys/hNubg2vQq8pBaWFJQIRMeAAxVPlwkViU9CJ65CcRzi3l8Eb
 WAUlnlCaqBfhsFiTHI3Tagf0VecMSYbi0qKfitt/bTQT/dEXCbvYDqIR19rsqtyFWtlXlRwRm9a
 0WBgrA4p2VJoIvgNlZagkOJnVD6+azDrAE5HniaJcEtbZiswRiewbmxP0b1R+je3/W8y8aAcuR2
 ya0LQO2k9HvVAbgLCmSdUihVyEdCHSV1j5KoIOi/oxtHjjyQnekH36q5IU0Xm4oU4iAg7PCpz3x
 tvFsuh10DU0r8MImpNIJNQx2Or1km7phbX0Y1sNijI+2sfZXl8yYMrfjJvKrX/9XSiHiQywqAu8
 Z7yYNIJgp/ibTMAqHmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93976-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75115186A33
X-Rspamd-Action: no action

On 2/23/26 2:39 PM, Srinivas Kandagatla wrote:
> Add support for sound on Arduino UNO Q board, which includes
> - Headset playback and record.
> - Lineout
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Please address the feedback you received on v1

Konrad

