Return-Path: <linux-arm-msm+bounces-93509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ABgFNNumGkoIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:25:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DEF168513
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE4ED305BFEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EB034D917;
	Fri, 20 Feb 2026 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIAT/F7T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgNx5lN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD834AAF6
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597511; cv=none; b=dfG5cTyBaZJfY7c43AJpMZqFcwXIrMwwpaF1HdcDIir7npLE19wPDPHojmUeo/FTvYUCt4Gi105kahfFk03VVIhXXp+Z8xs2LCLWF2ZAM22KImeLADApJOw3MwWZddTSJv6XG1VmI3b69mb42wguRY64fUkzcq05AiGvJzr5XQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597511; c=relaxed/simple;
	bh=hAVBE0mTrRinC7whF3bg8K+fUP2K4sg3EyAlf9XUDNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIfDJ3je+AV0M3vDj60XvkAI+sOe47taEzp+hCiWM0XGqT5OZNam7fh3O99UHGGKCxbYlwNF/e0zvKmIr5V0LwqQ8QIhFia0Geva0rGfrexMrWOAR1JxxLKR00dsYRCdyR9sJ6CQpmJAByUqgTTqyTNRzDQleMdR4f2wIXA5V+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIAT/F7T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgNx5lN9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RrjK3034413
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogJUMGuq87fvEx4oP7XhE7vNjZ1ydeJog0l7M3BV/38=; b=mIAT/F7TmJMKVGa4
	hmKPvMlB0L/WlKKdqMll3Qep2pJz8XVl/PFcCDbcJ5c90mEe5054Sk7+pVxOfEj5
	7So7dXQIUR9b9XCgErYrTRBDHiuBgvjp9Ex/q+eBOBu3qaMx+5+FSAZ56rwmSvIM
	fWCHvZGZ3ZbTMZ/ihK5NIvfSxem1yGcRFFUbRSl13WQxTawe867lOncHAj6XaFOE
	0VY3/k1fzxjNpQ2O3Bv+Y9WYj/CLEIoJkBT6/5if4+jKClOI6YeC86O6W7ol+Y9U
	Zu45+8jUwLebg2PA9FdtzWfV8oSgwur/KI3wzMPVPv2s/MTmwdS9x1EJz6FPXXcL
	eOJlDQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce6k031wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:25:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89547ddf32bso19079676d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 06:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771597507; x=1772202307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ogJUMGuq87fvEx4oP7XhE7vNjZ1ydeJog0l7M3BV/38=;
        b=LgNx5lN9R/fxcMtAPNNlyEaDk+GCceO8gSyDlJrUzK+gMIseBt9Bog7itoxA3RLfgj
         TGuSYrvfdv5nPhcJRP8TYpKu2fHsn61dElq0+GvOHISfNkHjp2cvguS5kmMbMp+r4R3g
         KRH+upKvtidUxl20dme7m4HArD9E0HIgZDsDDxA4KdfkRo7jULLfWdZxegpCn4z9Swiy
         BRiYVuSXxiLK35dpFpSvwtFUfrOYylW+bhK+icYfZgBR19faI7WPTN3njTxqpbHKTU3o
         q5ZOXm0SWbe0nOGJDaH4OLBEBcHqdnnV6Q+o2ZXWWCuaGEOKo7UfIbPF686jj8tgmSuo
         uJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771597507; x=1772202307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogJUMGuq87fvEx4oP7XhE7vNjZ1ydeJog0l7M3BV/38=;
        b=OPwk+2TUDd4mCxHJ+gNv17u+CqyfxYvitaW1tEPwVe2GLGIMgBzWRHVCWy2H3qiuRN
         n1ucyic9FmmR79nhngppF3eEWieksuJREMzxFc+MN7hHwRJyfnVcjgSW4CaEQdDGIMTP
         61Pmclfh3XTsNyqO+36X0Wsv+529WPqW+DNM9+BthV7jKRlS/zohq9OHebkK5wommvxp
         mSBQOMlLBpeU+X/l90FBfL8ws1pc/T9u+9PqlEWPdCiASMQXsSohYdjMRz4YzTCS3456
         8oxayRfBeJdTlj3jMjI2cG2INgrumHOV0YL0SLZt3QNrbyhw/zDmxIdWRxU9+dypAHpV
         FV5g==
X-Forwarded-Encrypted: i=1; AJvYcCXuib7Sl9tJh9VWNN7Mb4OtDEcv5xZNUwbRRIDNv0Kq2sN5dELuP0strHN9UJFKV5DuFpe8t0WsnfHaAh+U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5iSrizyzYaAg0ywAnIO8cNz34wmXauZW9CvNBBQBrsc2bwl45
	nHAi9aDlhpIvq3oftkIwebBF932CAATVDMHdG6nPuecZSy8FksU1EpLMoJPHb4MYJrJdEEqrntv
	dhdaFDJHssAN1m5aes+emdIxJHBid41o+WeZ4+PlYj3T6TwTt+h28kpwcRM7k6UqVkIfp
X-Gm-Gg: AZuq6aLzLUvfsuigsK01TVAJSs2Pvm7xSRiNdqQJ4Z+OQBspCLBWAopXV7Cxxba00nF
	vcpCEMX+Kvp1kY/OG6O1nATTYR0PbPBy7gTpeIngbdCu+L/goVwVsMocR0oXgVIvvDvsDEDSjF9
	Kqgm2NzspKAueZSMLz8gE0ih/NKdbN1U6BAVsiOrR+VAsoqLaghH22x9qtmsumuIGGFON8MELFq
	BJp/hFABTIKQnyiLjBsG2q76C6TXzsVFuJR/LFcCov4wSUmZjD8nqJr0DmvskHatvaH5UiK0pQK
	2dAIK4a6ACBgfhZ5CucU0j1JxSjvbG52pVlFy1GxuCDfAENLGHDTr8wJdpyx2y1a0q5qUQMearZ
	z16kpq0iWXpkBx4EGLhX/8p9cT1HNMlvf0YbZuctXomMxg4MvsUAaxlF4uGlUrdrgMyQFekLH92
	eR0p8=
X-Received: by 2002:a05:620a:318b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8cb40850a4bmr2498778385a.5.1771597507278;
        Fri, 20 Feb 2026 06:25:07 -0800 (PST)
X-Received: by 2002:a05:620a:318b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8cb40850a4bmr2498775485a.5.1771597506842;
        Fri, 20 Feb 2026 06:25:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7bf7sm667056466b.29.2026.02.20.06.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 06:25:06 -0800 (PST)
Message-ID: <a39f5526-8727-4fb6-9a93-36f412b93f88@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 15:25:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Add camera clock controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com>
 <13553877-a4d0-47ad-88ce-3d4d5b353101@oss.qualcomm.com>
 <c8e9eb0c-9c49-401d-ae4e-21dcb1e1e843@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c8e9eb0c-9c49-401d-ae4e-21dcb1e1e843@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDEyNSBTYWx0ZWRfX7K7TTeBj1Zbk
 YruTOdXuZmlS03vzKAFcAQXLWscB16QPl3/m8XedvkCKkczX+ETKyiDMPS7Y6DJZVSQxL3pgadP
 YpRVRYEc7aciAVt7sIZ7kaptT1KNTc9ajS/K/+JWVUHfsqYy3c79e9gTiArQ+JOGNoTofVod1QW
 p7Yu9UFn3/4okIaEXdU9wzho0Uo0Ia+c0TuqB6dtOKyV30682BBmvNi44D4AoMNp2bxkM0cmGzv
 bwbRfNJNKTBWT/l+ngT5SjDUhJ4xH1X4+bENXFd2rLjsmuYfaOLHd8bczx7FfpBI8gYJcNWO772
 NBfgXliWGWPPth3ZKUkfUEimQKk36XPf5jzD57Mnaw+FP0pI0XBjoH9/+PunB8rHSKIhVTtQEPu
 rIQle5orruMesJ7mA5zCJA4FNCG0CNW7FhjhEZ57O/RIosKJm9w6Gxin8bLGNmDoez99LPF2oms
 cvAIdOeCzy9G43d5big==
X-Proofpoint-ORIG-GUID: Z2O97ZeRF-Irn5twvZ0coHPsb2PVDPW0
X-Authority-Analysis: v=2.4 cv=K6Ev3iWI c=1 sm=1 tr=0 ts=69986ec4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=zG_g-YbQlRVR7SRETiEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Z2O97ZeRF-Irn5twvZ0coHPsb2PVDPW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-93509-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3DEF168513
X-Rspamd-Action: no action

On 2/20/26 3:23 PM, Taniya Das wrote:
> 
> 
> On 2/20/2026 4:25 PM, Konrad Dybcio wrote:
>> On 2/20/26 11:28 AM, Taniya Das wrote:
>>> The camera clock controller is split into cambistmclk and camcc. The
>>> cambist clock controller handles the mclks and the rest of the clocks of
>>> camera are part of the camcc clock controller.
>>> Add the camcc clock controller device node for SM8750 SoC.
>>>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Update the MxC phandle to use MX for camcc node.
>>
>> My point was that both MXC and MXA are used
>>
> 
> My bad, even I think I got confused with this. We really do not need MxA
> voting as it is always ON. We can sustain with MxC only.

Does that mean we don't even need any particular RPMH level on MxA
for this usecase, just for it to be on (which as you said it always is)?

Konrad

