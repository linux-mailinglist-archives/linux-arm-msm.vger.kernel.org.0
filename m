Return-Path: <linux-arm-msm+bounces-96601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFmYNiT5r2mmdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:57:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44608249D0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B242C32169C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AB337E31C;
	Tue, 10 Mar 2026 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1cI4VeQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwvN+orw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AA237D100
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139751; cv=none; b=ishg4LbRa5pidzYQ1FDZLm4KFc3tPKvjYv749kGamkB4QPZ3aZP6VNsGbYtgRtyXWHG0iuvsNKOaE19sfgGSruc5WfgYwQFyleEPyOfqv+cEhfpPh4ZzZvjldYKfwqiH7/035leQ39ELlaS4LJL/QXhUtGRFkiB5N5M6fe+ovq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139751; c=relaxed/simple;
	bh=d4uT9vz55VMZ8lK6PT76AAj0kJ9Hw6YCt/Fp3ykSQpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3//ECqlU1vvMmw/MYObLsSWfAYss/Wd+a9Ld/Sr+D697/3k2gi9QzQvPR5LNt03djfoeT+Owjk1F7aKqhKVF5u0jcClN6ILfFaIPNIX/zKmjD37sBAoteoqKjc0ZI/K2kDwWsyNs0OhkTS8+gwceGbm877NEB5MycpPtFBj464=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1cI4VeQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwvN+orw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8xkDU2363094
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UhtN4t8s2K41bms/kSTpWSYPln+wsvmKnk2d4yUllsk=; b=j1cI4VeQ67rnNDoH
	Qoom0vBje4gRYpMzaMcS4m/zzg+fmUUGsScTPIDCay4XPeNyxzJvV+2G1QEuULkX
	mcQBD0/pdZhmvFBUydWAmnZ35yPkUawpjceGWqU2JEupPiWqS430G3CMFROGRbSp
	2r/5emvqdY5OQ+DDdA6Wx1Pki2IRceuo6QU6fq7CB8TfCYA/e0LJ6+Qfm2qUci2q
	r/0yR5rfZiMKoBVzsieNw1imGykiXiE59QHSD9kHM+FyTffhEwS1N4Jr3fECttQi
	MWlFG/RbZZlLK1bNF+MOtb4uTlrbqoVxd0Nj4mZVN/nfYhD2N9PQe9J5hDjhhH7p
	3SsbZA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032bvdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:49:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8298ad00eceso2337457b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773139749; x=1773744549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UhtN4t8s2K41bms/kSTpWSYPln+wsvmKnk2d4yUllsk=;
        b=AwvN+orwD07/9+RXmsuDsikNXqK+TN1QTb1LJhkxN28dHlDoQww5Y+D7fOmYDbhT/W
         uCE4GlHdxreCZWmytXyLJqJbBmBXOTAIE+cRyOBkP+3sPd/2zgWBmzxjNN64Sv6kBONQ
         IdKujRzvUOzGSpNm5f0bz0cA+UIk8zHrJZl6RlpeyLtW6Hy+nQ2Ti3b3Wv8bf8z0tsJ/
         o1sDbKxgjGlH+oL+cNK6bbOYrG63IUWgNfEsO8WwnoFMrNfynGMDJcLy4yL5GAZuNy8M
         qBaXxlPHwGe6f9UqOhh/CXU1aXNeqpoS8Csu6ekT9Id1Enjg5oUoqhmqcmNvubNNzc1j
         aSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139749; x=1773744549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhtN4t8s2K41bms/kSTpWSYPln+wsvmKnk2d4yUllsk=;
        b=sqHTNc6EsmFhjxDduIPYLrPW404tpWqErZsdpnIO722Thu1SUZ1+rDfuihWzuMC2l8
         fR3iUkgsEV1jxhvkejjQaBhuwAzsPVyhDjz/4ovu71MWxGgrdqxKc7Hd5+3f4BRMyp+t
         kJsIfhDdb4DojlgpChN9a7eiULlDoaHoTWFbeTlHn2N2rx4rmmcvA6TjCgjwa2/jQfjl
         GFSEvGKoh6C2N+5ycLFiE4rhbSGJJySx8JYuHOBo4pypW8w278r4/1Jolpu5618qEYQ/
         57ZAw7sWgMLImxxlKpPqOY406JHk8trsgopcHB+rqi5ytNN4LC5PZvU/VU0edOm9ruuZ
         LDYw==
X-Forwarded-Encrypted: i=1; AJvYcCUAxt+8OvH4Vl2XJ7ImGc7o1G3B0N6ISHS+asjZ3g+Arvb/6hxbnIHTo7yQaN0ph26cAjV02/EiD2O+XkQR@vger.kernel.org
X-Gm-Message-State: AOJu0Yye4McKq2jf530Z2Xw84r7n4cBRvD/Q3O4eNod7kF0Rd2qHF7gC
	4l3Vz6zTwcA/BXMjSOO4MwjEt5CCkc0/VQ4+eFqbMN1mVNliQW6H5KnoLZ+5mTuQjkQvL/r5+Ss
	50E3Im/Rgbjsh3VAKpwHfWpfCVs4mYYLZt4O3cVzQrf3f6DdMq12AtL1xxKn/RiIWQ8CE
X-Gm-Gg: ATEYQzyw+/FsXXyO7mZ3xbCLS7AP+vse2CILfGdfdR9BiTA3fVQ5iGQcHaHRHzYFLqR
	S6CjHHmI/QzqU8i15DlgZjE2zqAk3m8SKAOOOf5qshENVwvueMEwQzJGFMLJhJ4Ny2l32CoMu+p
	AQlMJC7eQGzi5m68KhtY4HopNQyKzys9MmyrzOi/w5Px4X1hBsCVvVOv4uvL6mbY3wrurr7bXzk
	mfT8ZbhiXbqKiQOC2thfyBAWuFeJ50aIpuQbZON2swMuO2egoVfLt/Ewr+E+a2ziaH6xP5kIJu2
	Da8xH8A9rxgsnwH4NiQYjaLizVRW5MhHsj6vXHEjERvhdDIDOvCJkPq0ByOVlvjde4fJwCx9VdH
	GNuALQgjsgflvJOFOikgs/eZ7V1Jz9801eOXEfHjU6A7uyik1wgI7AvepsJAqsREw0ZKI0qkNC/
	vZpq0=
X-Received: by 2002:a05:6214:5290:b0:89a:44d7:6589 with SMTP id 6a1803df08f44-89a44d768a9mr88556196d6.8.1773139341359;
        Tue, 10 Mar 2026 03:42:21 -0700 (PDT)
X-Received: by 2002:a05:6214:5290:b0:89a:44d7:6589 with SMTP id 6a1803df08f44-89a44d768a9mr88555926d6.8.1773139340510;
        Tue, 10 Mar 2026 03:42:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef47a2csm478497166b.7.2026.03.10.03.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:42:19 -0700 (PDT)
Message-ID: <7bdb0697-f2a1-465d-83b9-c7b68238bf71@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:42:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: Add Arduino Monza (VENTUNOQ) board
 support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309152420.1404349-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309152420.1404349-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5MyBTYWx0ZWRfX41HVAc3KjXic
 EeLpRL6D32BEI9k3ctp50cGX+0vZ+tt8KK5y56PZMCsbE4eeyiPG+mq7tDpUC+CAomz78l4SP0+
 k24zAbvrSqaDovqifkWGgvv5FM6GnReIkCSsTgIViWSTZOaMrpSkx/fMAE2tRsXXvUxPUSmKFjx
 6zOEUZs+UE9sTj+KqaLxUCYCeTCl3l98M+vd67lxJwl2LIK+cMwm72d7hbPQ9E2IeKNZxuSuUvC
 ZWU2xF4zb5H4ZAzL0vkoq/1Ij3a9KUo/j+TEC7P8MLH91MRk6OFxAqnIFrTHwSjy+W7ywV9c9rc
 VTkAPkVlAcZFuv7jYy0GJtrn3fa3HhMNHqGjTxUk0iGPvNC2uOypb7XkBN0nGV4LAa1BcZorule
 A5XlLlAr4uS+Bvq0DFFesamessDG/hFBP3DPkqVgE6LdahdK6C0m9qfWuuN+RUBekZ3Qc8eKezA
 egR76HUx9JwsxlBRQdg==
X-Proofpoint-ORIG-GUID: rIuzkUdOiwwyCJciXajXIV93I4t2VWi_
X-Proofpoint-GUID: rIuzkUdOiwwyCJciXajXIV93I4t2VWi_
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69aff725 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5D_ixgJ-nfAih4ZOxbkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100093
X-Rspamd-Queue-Id: 44608249D0E
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
	FREEMAIL_CC(0.00)[gmail.com,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc];
	TAGGED_FROM(0.00)[bounces-96601-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 4:24 PM, Srinivas Kandagatla wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Add device tree support for the Arduino VENTUNOQ board,
> based on the Qualcomm QCS8300 (Monaco) SoC.

[...]

> +	model = "Arduino VENTUNOQ";

FWIW the marketing material seems to call it "VENTUNO Q" (with a space)

[...]

> +&usb_1 {
> +	maximum-speed = "super-speed-plus";

This should be implied by the controller capabilities - does SSP still work
if you remove this line?

> +	usb-role-switch;
> +	wakeup-source;

These two belong in the SoC DTSI, the latter is already present

Konrad

