Return-Path: <linux-arm-msm+bounces-91003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMj5Cqz+eWm71QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:18:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A789BA11A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85FCF3011A5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF8F34E777;
	Wed, 28 Jan 2026 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="id6DjG9i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZNseZ7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897962C11FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769602724; cv=none; b=BkY8yXQOoxVswv8gcFlXCk/Wv23FAT8+/H8/9+l8iDsuwqS1myrxZRi83O5MQwSomXXWtc0b9Q9bGGqquJ53GozqOTKBo6GZB0XZCH++bXeztq+mb4HoYz2V5Pk65BTJVdgSN1JdsAOD0gJCQadYXvCrp1otliRAIkg8k144yKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769602724; c=relaxed/simple;
	bh=DMmMhreLgLv3RpK2hdkoQf8ltjDnfcVvYg/pAg3TZcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+4AYniuXTTRrUs0Qqw6QLZqRgyj+UZqGV/Wi7xiGJ4H6a/UwzQPvT92lJtfW9ZA+7p8Vp2V1UKtFLed/mi7mF2QTdoogHV0AFH+KcWD9k227tg07gU6l4+9ZUMXhNrTGUHoE13BLWDZuDTLVc9Ek2m9h81Etf9qesTXyO9SxTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=id6DjG9i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZNseZ7u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92YVc4008517
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSheuPGmQbSCmzopJdJP1rGwvdaP2iimvKo4q2g8rlc=; b=id6DjG9ie66ASTzK
	H/edKHvZkRbSHiar7UeUvb2YXZ2mkpDLWsKLmxA+ViOZs+DBck6qr48mNhdCLRvu
	iGtmu/Zycm80FAcvZtWLBj2ycIflxBSrgnUpL1XtK7Zyxz4ksrqytxhmsRs1T9ym
	eE/q47y2wzhQ/1xraQ7IIgyMnezMG2qwPyKvxFJGpTA4t4RLMIrhsI7KMC1nB848
	8oqsEq4cTUtuZMxp1M7MWPF4DGYEV21JHxFLzsN6P407nZ64HOgWgFNH+U19Of8m
	jdHL+AwMe+EN5YvC81Yxec/R+/L4cq0ESga5HQ3lRdbPduFh+n2x7bMwgZ3je+Is
	GhbtJQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1jx3e6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:18:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88880bc706cso2569866d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769602722; x=1770207522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSheuPGmQbSCmzopJdJP1rGwvdaP2iimvKo4q2g8rlc=;
        b=bZNseZ7upBh8nr7bX/tCj1G5OSBwtB8MKgl6sKvYGYZvQwD70PQIyQXDdlE/zjsgA/
         bVYiU/PuU4Ts6nkOIHg83RIKqXfcRkguAmOXc+qbX8BFgdQGvRYKPR2YvHZircuozrct
         0fiHHHnLi2XcAer4g6YngvMVHOstLEuv1UjNNPX6heG76zcPiePEOCyIsJjUd5CN50b+
         zmNdRp/VYBiVHh52zpC1R00gYzHjAvLtqj0h+yxdrWSdJCs6Nvrz1iiiaymMj4bJX5hM
         Dvu3yuHuyPKdu1tMO4ACnoPPKFm0TP19rTa9MyPORAj7L7O4srxWL05V1oKnl6kvwksd
         JO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769602722; x=1770207522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSheuPGmQbSCmzopJdJP1rGwvdaP2iimvKo4q2g8rlc=;
        b=YRZgW7YiNlAq5p9hLUAKrmTRcnUl/P5hIS48TYxkIxPpvCBbdTBAUVhup1WfOnpsRr
         /GTENl3YFLckG6GIIEBXsAjW32e91HHpv0WSS36174rkSWEQXWAY6YGXvmNejBe0IUXl
         mF5rvcbJUDoMLHc6hgDaxPmtWwDD20FWWHkc0qLjBeRFAsnIzz4m20FIxkq5Pj6q3ty2
         jXEkW42FWk8+/p6N45VfLvNy4S4BG38rSY/L9aCvBIJeyDUEAfp6MwmPKwl0QkCIKssi
         y/S2biZmK9DCXKlAtpH1WizjCQEbtWAnzMYxGlI+n0ZJyJzDrbfJZ5AZq8aHI5dahEOl
         93Nw==
X-Gm-Message-State: AOJu0YxtbvPFrKS7gs17iKTKKac11j+sw3yvisZJSit4mvVRoMLTa06p
	G4BOIFl+TZrn1+B1GGEm078E8Wwn6W0XmmstivS1m0RADf8dwwvoaDbHoAuLsdJWw3IfkIVyBvs
	ZVl7b6Hfg6R5OaFHUmQSk61QSt6rxbxPOAgOOHA3J1ko0dsMQGhsSC0xdOXx4DBnzhYtW
X-Gm-Gg: AZuq6aIQOuVijhJZoOq4hg//Nnuzu8s6AxkZ5QjbQUURYLZaoiiikT5Q5jFk3S2mzRj
	BVtBaYQeEL7/l8YYoA3ciyOA3y1IydVA/wwnTzypnArRX4PyT/4rDvr5len46qByths5ENJqGAQ
	/T2MI3MiHbLolzeHwGi48fcLsRp7BvlTRI0f4jCmnLTBA35LW26z67GIY1EruQaKVWbkmq64V0k
	Y2gMVNBPpHEL3qPeOLqffm0bevMDdYgtVYbdhkAHiG9aKTfdCJc0wRb5TcMuTcaQCGoh9picipk
	DXRdzquv/sVEBVPNcKKEdwMDiGqtPOqhECmX7KxuJfMLuAplUTexBkh4KwDGqGBCeQyrckIuT8C
	eaI7SEa5dqn5+M4/Ukmjv2ZYjJeHbEz9FbLn6yGgmOLdXa8teQoGIBb4LpiR2a9h5+PM=
X-Received: by 2002:a05:620a:4109:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c714bf34dcmr130682485a.7.1769602721807;
        Wed, 28 Jan 2026 04:18:41 -0800 (PST)
X-Received: by 2002:a05:620a:4109:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c714bf34dcmr130679885a.7.1769602721367;
        Wed, 28 Jan 2026 04:18:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef86deesm121350166b.3.2026.01.28.04.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:18:40 -0800 (PST)
Message-ID: <4a59fb83-6682-41c8-a420-6fbc472ee63c@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:18:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: lemans: disable zap-shader for
 EL2 configuration
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
 <20260127-talos-el2-overlay-v2-1-b6a2266532c4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-talos-el2-overlay-v2-1-b6a2266532c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 58HGx8S4K7Prptu5N410DDmekMV2-Bya
X-Authority-Analysis: v=2.4 cv=duPWylg4 c=1 sm=1 tr=0 ts=6979fea2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MuuGkx7wlpy7Zk09e34A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMSBTYWx0ZWRfX0pF5qC24hzvQ
 esFKIz/5hHiX1DvvwV16Qr0hKfAVifAj8X5+tOoV5dijwRuTW/0ZnserUI3HJi7Hmp+aHdiKwcA
 e0OWHRMdYNLNRTzWQeum4TA+wUSYETYnNJjbfQJOZuxO0uDn17sUHBoUxsKhxEPSTHlKahnQijb
 WzRUvm9ImqPqE03QDcFEkuKl/tRHDzb6rzeF20sqoGJfMcsSEavQ+pHIc6y37KVBNnH1wK/DAyp
 SJFSFgp2xGSYRHj0jc6gtIPSJPZvETGuFAij0lffU49PUt38VgVbI8VIb6BcETV17fzZbo9eixw
 achjcZj3FNNt+L4iCLh9sVB1WfILedfiLZ1dDi+mybWDw7ACW5nFH3rYp6ckT1IQzcblsoP5ecr
 lvnfEZDzvEx73MJ+2IpTvWtvd2JsRaS66I+B+H/O2xOzoJfU5ypwq6F1mqpecqlLFIOauhPsLh8
 tTctcURJnOjBe1PqRmg==
X-Proofpoint-GUID: 58HGx8S4K7Prptu5N410DDmekMV2-Bya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91003-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A789BA11A4
X-Rspamd-Action: no action

On 1/27/26 12:43 PM, Mukesh Ojha wrote:
> We don't need to use zap shader in EL2 as Linux can zap the gpu on
> it's own. Lets disable zap-shader for Lemans EL2 configuration.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

