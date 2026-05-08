Return-Path: <linux-arm-msm+bounces-106605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIXsC5+i/WmwgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:45:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC04F3DCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71181300E24D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 08:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B32378828;
	Fri,  8 May 2026 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOJFPO6b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FujbfTyF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BDA33BBAF
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229905; cv=none; b=G3kcuN78bAK7gop5ztCW/mrcxU6NWHHHz+2p/ygqhLf6Ah6B9CSemePTmOgrtUuqX+KVQ2+kIDJYbR8nHbAdm1v/W3PpB1kt05xSYQgVP4Y51lZhllxXOtbfmChkwqFqDjaPV9rCujeF8RSg1CvPgFl9UpTASqfj7f4wEIhme2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229905; c=relaxed/simple;
	bh=NX25TNRxK1f5CIXLrEM5qUNBPfm9dkjgT6GR10JYE8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=la9EoqNdja8R6GvaLRjk9YLbE55DoXyoJcToJV5AArATOMpXqq+pDQ1MITKBdrvAvuIgzuqeVv7Kj1KvMhqWYmBdP3mXHbq19xw7bCBjY4IjwUPEqW9gj1uvCfLr4AMkPRqXbB/KdMGHwtWThIRXo+wV+oWJTF9IfNOhUNcc4to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOJFPO6b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FujbfTyF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jKVf258436
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 08:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQdd1/08YPTwCMkeEQsWN2sR4GrpO5kA/rz43di/igA=; b=QOJFPO6bf0SmH2tP
	IlK6+I491bCZRON9TopR9ts+Gz1Zeypz5rByIPauFEkJYiANDRRbVSTaaPu6uUUX
	VIlnmbziZs0vdRCqfF9B+H08ffnCu3QVUh1516vCSUEXvttmhmZICJEUkVRq/nJN
	d7m1ZrRGyyil3/BfOOIa9+WKODuhJo599AtxA2Z+xdIQaVHoojTOTNNsMWbm8cks
	62AF7NFfDr9OzIcDpgD6TK3Ou0kACB32V17hTGdeY5OxOws9NfhB90W/OCJd9qQq
	eAPROkOV4hlinfHl2tzzsn2LDxZMtmEAdTzsjHX+WvmMv6ni9fAQffcLkv9F54g1
	4cF7fQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegedy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 08:45:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95f15c2bc61so118679241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778229902; x=1778834702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQdd1/08YPTwCMkeEQsWN2sR4GrpO5kA/rz43di/igA=;
        b=FujbfTyFIZXAYK2CGRu5jVPtkunTlV6k0nJKZKFC/BZZiEEoH/ARiXkvBY196LFLnx
         NpS5SYuiIcLzuRGcKqXGqJeNZcecjuiOEYL03oL0K0I68DkHJK67EToHtrCqjhBPDn5u
         szcHa2pT6Az/0D7/NQrfMv02vyg1YvFjw4UUEWgpXAts5XdbNrKGiYFS96vfn21CnRP/
         AVlkqBJvS9qBR9TwNozXpSh/JadJG8CCJ6MlkN/7AVFoM3Qfhp79V9Ru87jlrbL2stZm
         DQ25paTXbTLrh1c2cZOEf4tGy0Lx92NNCyvNA8/Fl82ohBzDujMK1+kiVZxX34e/kET6
         5LMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229902; x=1778834702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQdd1/08YPTwCMkeEQsWN2sR4GrpO5kA/rz43di/igA=;
        b=E9cDeTbpb0jIKvPzIA0Rf+KXKtV7yWb8LYQa6KzRjR4h9kyhrirwprQ5czhLKk/++J
         JHYuJY1YohxuzHive+Sfjzb+jw1ZAWxMVbXouMxBFoFBsrXi/uHLJuPliRuyT6ES+ffT
         NstNVoiUxB93M+ucUv4SIjS1h1r0zTiSZnFCIsTX6qhKZXGG6ZQBNyI2JLYoVKhZWgaP
         lY0SMoa0e+KMNio7t+FfIh4bafvMg3Dj9j5WDJSyuaALCEKs9KopJMRsoxSPNYVx9NCn
         tPLVQKnA+yXmvRrmJKsbkJ5HCfO0WQaRje+1GgtlyUCk4IjMzuM+GTf3OCu9sEZ9txqP
         hUxQ==
X-Gm-Message-State: AOJu0YzotYpDqk002L4aZZewZoFHrn/5ATuJjl/tKpogIW10ukrUQOK5
	OjRBx7iVWmXZsOFiqh+SQXMINxKdZhMhZx8P1xuzufoMrpL3vPd5wseH0UFBakCfR5k3N8yJb2W
	WKHxPlnE/zDFaJ376MAdSl8kJ7DIbcwso055LdRxh0cYjM1uh52m1PDWmrDeuZQ4jGkzt
X-Gm-Gg: Acq92OEKKfbty7pbqNQkufeBDPmM6Lc+JK0nj/Vpi9F+wxX5py3UaYq54SE+ePfpc/3
	jrAY+IFce8KB73CZtevQ4vF632DYOcuDtSIOn3oZem4dakUgt8ZJ7Hz81jAe/pwfTm8alTkGEvb
	/b7fve3axOGAEyn1W2P0dov6BDy2NM3m66XdUiKhIXqwOw23nCWCzsfgzX3lnxuqXHlYDB/I/kC
	aWlZwH4R70DkrLiBCoqkJTvWwncH5miSozgXwJ/ilWn5+9UXhzmXzees7O+MdIHPI+MyX/4GCkX
	S8PJGGYcxHur4MSGytd96MOxFXK2jk8WcRE8Z8715YqM2tNcdKrDo8EOZp98G5Y+tHt+iKmBOVV
	x93TaB6d04iMO7qm8eKyI+n1KqNBj79oNhyKh9B/BuqEnyOSvl5TnW0Wp9Jn0M/oR1Xv1nvUgeD
	AKP1c=
X-Received: by 2002:a05:6122:c215:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-57559508f4dmr2249174e0c.1.1778229902578;
        Fri, 08 May 2026 01:45:02 -0700 (PDT)
X-Received: by 2002:a05:6122:c215:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-57559508f4dmr2249161e0c.1.1778229902098;
        Fri, 08 May 2026 01:45:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcaf9af3f56sm35638066b.32.2026.05.08.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:45:01 -0700 (PDT)
Message-ID: <936b6835-342b-4693-b276-2c09e259defc@oss.qualcomm.com>
Date: Fri, 8 May 2026 10:44:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Switch SCMI perf protocol to
 use power-domain-cells
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4OCBTYWx0ZWRfX5ELvj+W8OLYu
 pSuhdZkwhQCVUy1ues/+BW45xfi5d+lMScaoLavyUUPvLYhJ+GqWZlkOdM7BdUqzNTbIbi67o+6
 YN1dTe7i6GpbEUo8Vl5wHnAKDDi++PfS1sZLaCCInXjoiWprvXn2IAht3WM0k0HrUN0TGwEwycY
 J5UPiItLDbfuXih2dkhoV3m56luzsPTS0AfEaDI5nIzyvAvl2M1aKItCkKflr3x98QsBA1rY+2T
 LPi8rwZBY21iRJXieMq47Hz4hlnw3VGh4jaoA4B3ih0zTYZgavDlj9WbZgJ2KHNT1u19FYSnoHB
 NoxIGmpXeEILPNCGaaGulodsy2I6VuhLH1BLudV0noK5kDB1cE+kq1OLsIwqC4Ty90Dt5JWFzfe
 lqCx6wmes3B6nm9gqwp+cJxWOB12Rkdpw9J9cbjOYFe8KY9r2ig78fUjQOx6pGPxHRnHstGGL2J
 8NUSR4p3Ba9yiXhjtZw==
X-Proofpoint-GUID: cEUqM-sc87F4ymRgAWJPCFfrr1JFHnEA
X-Proofpoint-ORIG-GUID: cEUqM-sc87F4ymRgAWJPCFfrr1JFHnEA
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fda28f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fqTeQLrJ5r4hnVr44MMA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080088
X-Rspamd-Queue-Id: BEFC04F3DCD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.13:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106605-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 10:27 AM, Mukesh Ojha wrote:
> The SCMI protocol@13 (Performance Domain Management) node was using
> performance/power domain, not a clock. This was using the older
> mechanism for passing the SCMI performance domain index to
> scmi-cpufreq, which predates the #power-domain-cells support added
> in commit 92b2028b00ff ("cpufreq: scmi: Add support to parse
> domain-id using #power-domain-cells").
> 
> Switch to #power-domain-cells to match all other Qualcomm platforms
> (sm8750, glymur, hamoa) and align with the semantically correct
> representation.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

