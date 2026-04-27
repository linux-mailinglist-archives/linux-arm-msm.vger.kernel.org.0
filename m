Return-Path: <linux-arm-msm+bounces-104700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGuKKBJC72nm/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:01:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9D74716AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60A2C30276B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46AE3B6368;
	Mon, 27 Apr 2026 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMKZCFPr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duSWpXSa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24D3A16A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287674; cv=none; b=aLPkjpilqnzgHaLzMhHSEnNZCUOIhGcis5mbRc5Y676XIajUYYDXRkAigtLuwmwn12aUVUiwvQ/A6zjBDua4uBTKzlgQ0JRk4RfmI3xXRfGRFVOwVBKCuKtzSG6j0HvzBTw1/Panq7UddKLUgvqM14/odSo8B3DoL+Nkn6E5hq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287674; c=relaxed/simple;
	bh=BabRsBZEcA6X04PKKW4mSyEM/vDEC88pHSqElLuPR14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afwcEAj6WNEROJDE1Mm2tPSq8o/pN3QAurc/es98JXdUjPW/sCVin0SVeTrMU2zw/tv221EV6tL4lalwoEOv131qPr0QYxm83UkKkRwls0koj07lNBOzydXXtIKAlvShIuecChvuVQ2m9cRtlWrrnaeXcmSaBSXQFUs7fb/DwSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMKZCFPr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duSWpXSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TJI72914115
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbC+xY12QjdWnEgzBTXKckoouGSye0MOBz0vw/yCUBE=; b=kMKZCFPrEwZPxXJp
	IwADnGogx946/t5y+hFvx0Rl367AWOy1JvO9Oue4bVEejRnLxQb69ra42jh4Ra6p
	fMge8BAzj9Vceg6xgki4pBwQwFHIvstIMKdwoQeC41CLJD5S6sRMmJRXRSWa8Ouw
	NPQfvT18HDly7mv2h5PDmnULFT6jE6Zhxin8TsUEEAs1K97Z2KkIdAvsy+V1gG1Y
	YJukMS3H/HuvvGa1pYLRrFhtIR0M4+eZSR8hMF9MUvBE/yWgysohSImCUY7uzA0J
	AXb2/p7Zrs6yl61+eA0hhVEa5HYi+De0P9gv9O8Nx7PgSkoCYCKvZtk3Lfjt3vo1
	12bqdg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xh50u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:01:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f220f1dabso7483314b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777287671; x=1777892471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbC+xY12QjdWnEgzBTXKckoouGSye0MOBz0vw/yCUBE=;
        b=duSWpXSaSyBICzjyhDg8UOXm+6PRicdgceGMf/RwliwNdNnY6PtDn+UggkrQ9PcVm/
         mWDJBYbOKA0pkFX6kY98REo9bxRcjRTorTY9tDmBtXikVUXA1Z0kp/w4p2s8U8aVbBJ8
         kPCfa/QiYjYUm/REVIYInF98+9uACO2dby9xH5nraDEgjUbFEsIGXf+W8IdmXkVdm8Vv
         uBbZ2oG9nj5h6Y8qRMlhX/llcIFH5x16LTT9A0einuXrHT5/vYYIaB5HQ70CWSD0GzDF
         pVwk9wmQRSVrOcZ+HVudj/+zyRIXNWVy5teCvCeNSWi0mcmZoADiOEZoCJp83SJA5gQ1
         +OMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287671; x=1777892471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbC+xY12QjdWnEgzBTXKckoouGSye0MOBz0vw/yCUBE=;
        b=J26B+8BlBJSSUN0NOsGAROcskE0hRhkyBKbJ7xPtXPAbG0rUgWFRkzEXrjYDAVBglj
         RxZ89g6z7OVr6f53gFdgr04DtQpSNWUrDODKGIEFgu8tegVHLDshQl25s0U6Ch0v1XG1
         AyK8xYxgBP/w4CqH6izl94LFz4LGJZpXkzY12HuPmCo5amMHZtZZkje9a9BiUQGRS64D
         q5h6+GqkfQVl79hJL3mGPZAMoBQGUcoGsvQWp9ekk9259h2DYAYl3EB8nMNxAzEHt3k5
         dgTsPsxNLyulvOP11U1HwbUmkn/1Quq/o3IQFx9z+i2olm+3VJQp43vidqRNZim3wUh4
         GVcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HFon6JgTuZNLqXDIRYS5//M1XErj34PolSArPzjSe6UcM6tEHUhDzlZiXgfFusNm3f4aX6+Odud7hIPme@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7xHkOpr8O+LBi6qRN5VcMKX0lMIeOyb47hyavnpoLUaKdkuJq
	ZenmW8gp07/JePsMnCnf/sRp0eOO3RZeiUXJ+k4z5do+eL6/0Ge+R52n44tYABW+xSsCwYpNhnu
	JQdPV7hgtHm0Uc8ZqWiLIuZy2aMX7GgKwrmz00vaEcaTK37TLDJvfZvW9Mc3o7NSlP0Mu
X-Gm-Gg: AeBDietzohhXCWC/30/ebaEJ1ieriuqFNxcH1kfT/VVYOPu1LIdI4LpZBnTLXBDWjZu
	CBAkR/tuWGByF9PbN2F0heEVTmA50eSPAR7wgY/SgAItrUi43XHabW1n4cFpl0l0Et2IlMn6kvT
	LjE/Uatsj3ZHWfCkTMy8lwu0SOEB0TVeFyYt2IISIg0t4QAauvw3W2cHaechtRHKyjG2iTsw4o5
	rZ3y4oR4xy1yyoAMm93PwYwxo6HuUhqa1LQnogWvB4ZYkJQQy6Urp6Ghd0+LByG3mLm/wOJYenK
	73yekH56jCgandBmTa/I1mh0kO2SYrUCwrIRNu1Q+/qM0U5cY5jGHjLoKmHF0X5fmfBgoNlmQBB
	dwxuyWaHkAw7Y52CFaPzDRCAD8xUsr5FIiw7UKmIa+ieAd5mKipaC33gMVEJX
X-Received: by 2002:a05:6a00:4c86:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-82f8c90b7dcmr44779000b3a.38.1777287670926;
        Mon, 27 Apr 2026 04:01:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c86:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-82f8c90b7dcmr44778932b3a.38.1777287670285;
        Mon, 27 Apr 2026 04:01:10 -0700 (PDT)
Received: from [10.204.79.32] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea02ef7sm29711481b3a.25.2026.04.27.04.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:01:09 -0700 (PDT)
Message-ID: <48ecf277-da46-4994-87c7-7eef66956cda@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:31:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: talos: Add memory-region for audio
 PD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
 <jjnciedre42mqllwoe4mkmi7a355itmbcmuhc3oyrpdjyitnkj@mntkm4zonfdq>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <jjnciedre42mqllwoe4mkmi7a355itmbcmuhc3oyrpdjyitnkj@mntkm4zonfdq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tMZagLOqFz1NlUld5q_lLa4wb3b_jvIU
X-Proofpoint-ORIG-GUID: tMZagLOqFz1NlUld5q_lLa4wb3b_jvIU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNyBTYWx0ZWRfX9PvS18nXPf+D
 8JmqzDzg7QefjQuejAcLLJkut140479zj+DdZCS89Qq6Y1x5qumfwhljd+0qhv7lpXzApr+QJmi
 ZISBvDUloELcm2WI9oPNOSKVcpBDxm/ILSRjLf3W5/NFh6JMXXJ9RDU0/p3KcDFNdz6hgWLy5ti
 J9TMfaHIUw7u1nXw24YJKkxk+GcpAdInkWb1e9s8XnmAAtRioojWOYuYLhj4r0bxJNmJufRSTss
 iILzq1t0UcIsFS20dIcPZSzy6Rcck5A5+Bi43KCMcIjTKpjHQL4Jx3NqcFsZ8kVUxRug19D77zq
 ewb6V7W7aGKSRqqz58CvY7nF4bxpVO3XLZSpjRKCMHXZQUIEEYJ6YdFvl4zJACbgSsFpxu+vGLZ
 55opQM3m7t1v0jPt4ceiIVXMYGZqZsleVI7qfXQ95ugvqzdJwF8eKqF1qC+FbRgvm6ahIMdQbRC
 u8pgJc16teYXKnPR2+g==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef41f8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-H-FHYqvV_8G-EK7XNgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270117
X-Rspamd-Queue-Id: 9B9D74716AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-104700-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 25-04-2026 20:43, Dmitry Baryshkov wrote:
> On Fri, Apr 24, 2026 at 03:40:22PM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Reserve memory region for audio PD dynamic loading and remote heap
>> requirements. Add the required VMID list for memory ownership
>> transfers.
> 
> And what happens if there is no such region allocated / assigned?
If there is no region assigned and audio PD dynamic loading is requested
for any offload use-case, it would result in audio PD dynamic loading
failure which is the major purpose of audio fastrpc daemon.
> 
> Also, can we please get the remote heap set up for all the platforms
> where it makes sense? I see that it is only currently set for a very few
> devices (hamoa, kodiak, lemans, monaco and SM8750). Checking the
> downstream sources, I see the remoteheap being set starting from the
> era of MSM8996 / SDM660.
Noted. I'll bring this region for other platforms also.
> 
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 


