Return-Path: <linux-arm-msm+bounces-98319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPHxE/klumk3SAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:11:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E446B2B5BA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F456314A81D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 04:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9074333C52F;
	Wed, 18 Mar 2026 04:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpkaCPTL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fO00s5UV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48633B96A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806871; cv=none; b=PaCjnUHlZbF/aUskcIG6XiEXAp5I3OUtoeq5zyIw//CWDQOdVWT2nB56UU0cu5KsLiHzU8O3kaZadlq4nVhe7woTaedWsgdIdmdPa7Am7oP+D2rDlLbwUhUsznhU2RG+2AqqaU2C2ZB0EHkUNIwyQYX9YG1ihGERqlpUeQ2lpRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806871; c=relaxed/simple;
	bh=SOWNwEgW+yqc14NA6gQzwIEghM/umtpaC0GhdYxBqx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOW+1ktSQfJp+Wq+1geoZTizF4V0dZvjg4EWEDQDBc3rr4M81VGVqNmkvRBenhu7nB58pmxSQ466eI0iWuXnKlj3AqL0VXOXvqRqUTObEFyeKIkwZFYXpayaL8pKAyZ6lmn7ODEFR8dqdZNQRkCk0qQ2iPRfCrNN/4aYHdeamBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpkaCPTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fO00s5UV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2stHa3281317
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6xrBMFAJXheTgn6LoOrZwCJL5Zk1iRQuzTFNEhCS0A=; b=FpkaCPTL7VmXJRfg
	22ZFXlq+veGuJU3gtf4FxKCG+OAIeYP4i1Ezhic7mlqA6gqnI2pg6UlVqenxCVz6
	mGoVJstu7Q2Q6fD1PcFGlvfQ4xKCxwOjLa04k+EoX+3WgyIqqDZEP0YL8KMu+2Ry
	E3RtY3uckWZzHFA+ardj1ci/q7iAbhlcwxB228jBwmELmmJKq90b2iw2igbVa80F
	zMrOXLov6aMt2q6zPMSvz4CHx5Tcgar6cWzPQ9O2n4wxWGm+/DKmZ0kCqeZWjwsN
	R5bLzHZQ5apD2LnPXwCTlYVKEEdOCFHt4kIN/kGqUinxb/F9qKoHT3KkmNlbeCz1
	HFamnw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62tjq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829942cf9deso5490787b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 21:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806868; x=1774411668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6xrBMFAJXheTgn6LoOrZwCJL5Zk1iRQuzTFNEhCS0A=;
        b=fO00s5UVknLwQd/kOPKTKiZlqGYHEA3k2yAj9Sz7njyDSsbdKs6687AB4iIolh+jth
         z3r1mPGgAfODotS3/TlflknUjvt3ikDK3PQ2N7pNi/psXaG5UEM3dyYUPEpDQZSYCPdD
         Oz0bSjPwCS+8IYcri2vmdFdHuobJCdNmW6BNGGLHma073QnTzajlN9f3sSAkhDyLWz1f
         MdnhDHIlJt8yAQaC2B8o0BMdeM1i3bPwlmZXPdWxKhUteSQzniSSqqQm4fllfl7acvAB
         ITZMM4qttDXfPh02unvHsVrlp7VZPF4lAparHBCSNZ8dC3YFFykzQzR4QyVZ2B0Xp3To
         io0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806868; x=1774411668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6xrBMFAJXheTgn6LoOrZwCJL5Zk1iRQuzTFNEhCS0A=;
        b=SZ2cnek46P6uQQ4bNmwkKfZE3Iyffpw4AS58eVahwK1u5sVu9TYQmyeop/rL/aJnXy
         dtLnI4mTqShN0Dt99SXDq5b/FQe8ep88T5ghlkDd2jrAK3s9S/1hVWul8ajkn/zNlLa1
         HCG5VVurCB8SFX9w5vvYnd5JBsOmS0+I0N0djkZLckh6t5DtnFxFNKquRe5rUn5XrZrw
         9XbhG/Aevz8gi4b6WbzKObtsH4HK861S6/7M7GPuiPowa/8jlCDrTRnzcxRnBrgSj4Ng
         I04n/AfPoyydLTK52A97MlibpmQk9e9zDY0qhVAPJXdV9y7nz3ci2SkcPXEQoIPrHyhZ
         jndQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsF4xBlRp/Aq8sbYfJxG1n0mkl0Mwe+ow54OztqfEnib6I3hS0PV1M15pmW0OW84HJ7YDDXSzxcjUOX11a@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn8GDQU2DnHfZmlhRA9OfFroIIZEfpjpD93fdIevcAzHpM7zqf
	A2+60aC7V2MN+nBUMzQxjLhh5OsyTPwqILZtHPnX2U/n0Onl6RBzEshZ9SKAM31F+SDDd6+rEO0
	NuBAXi7xF3Y+nQyVRAG3u81kBwgnJ7kV6if/axg4IsjidlyoSK9Lggug2HlInWL1ftF9X
X-Gm-Gg: ATEYQzwOmwMDRyM4Uo2lgWOeSStYnr/KqszBDjhcF+IhMtZNBjSlQQQujrgZqNRrY9L
	0Q2ZPLzHp0T6HSkLqc5amwknYmw+G/+8uhNU8e1cIUpGHPgOnO9/RMcUIgHK46PtctOn6hYLbxE
	X6jL/5C1tm5R87svq/GwRg/rL/SDGflTXfQWZo61n0dxrlkdRA932maV4V8Yu9FxZY0LfdhCGdD
	mQK9ZAFTNg4Sp8zw+qewkm+SNQNahH9QSygGgEKvznQJ5tF3D8M7mm5iH4JFXi+a259XE7WW6n5
	hhlTVRAZ+o8OpxFzA1hh1aqnceRBEWe007ubOee81UMSqEnfD2npLBOfOSCyDe7pgE0xblSDI47
	Hh8oeAjI/HHSGQRBqjKUPXNTN3SfmWIaAdssctxplKqd5tTQ0yQ==
X-Received: by 2002:a05:6a00:915a:b0:82a:6b97:34a7 with SMTP id d2e1a72fcca58-82a6b9742e0mr1450315b3a.39.1773806868123;
        Tue, 17 Mar 2026 21:07:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:915a:b0:82a:6b97:34a7 with SMTP id d2e1a72fcca58-82a6b9742e0mr1450294b3a.39.1773806867620;
        Tue, 17 Mar 2026 21:07:47 -0700 (PDT)
Received: from [10.217.217.233] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bdd5569sm952839b3a.47.2026.03.17.21.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 21:07:47 -0700 (PDT)
Message-ID: <caabd5da-166e-4826-86b3-a1d80fe193d4@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 09:37:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: defconfig: Enable clock controllers on
 Qualcomm Eliza SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-7-4696eeda8cfb@oss.qualcomm.com>
 <1b28cd99-3a6c-442f-9668-23aca9b1fea8@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <1b28cd99-3a6c-442f-9668-23aca9b1fea8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba2515 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OaLB_a5L4ud7_QXzgQYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 5CIdWvCaSejKuG5m_oVm-MXs6S-CQOkW
X-Proofpoint-GUID: 5CIdWvCaSejKuG5m_oVm-MXs6S-CQOkW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX0+4c6tA0AoOg
 gjOFhig0hEJuy/InnJBY3CrIIfM46pGVF5Twg3OPSCQ1sciWcbynJGvv1wa43Wx1oL1J8MlfrOV
 PRb+g1etkOJFCNWZaV/pxBaZ0Odsl+J82TR7S9DA6P3X9VeBgoMZRmS31bFLGFz2WU907lXJ+ID
 39KJB9lZ7/W4xE1WtTdK8GuvuW0Jq3kFrDFXaQ8oddOFXTB2OJN8X1xZp7gUO8WJuePIwurnoiK
 rBcQxr0rMkNoRHwkfsRsyOW0wKJc0EF9oumfFdGxkul7p8XDXRTk/JoIjFOlZTyPt6RdGTG5Nr7
 DfTepUixTD/pvsKZP9dUUi2lFu6GQ36tWPoi+UlI4cpyoKZOfGOF44DAPH7DpBOoj9FcWckptew
 OribZUhoYc0UsK3SikLcNFNKhsWQrxUdD/gI+2BQgPUlIagK+prJFB5nSXy2Bbn8RuYY6xDJFCU
 ++TRfR9j1O6WnZmBGBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180032
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98319-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E446B2B5BA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 10:56 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 18:14, Taniya Das wrote:
>> Enable the video, camera and gpu clock controllers for their respective
>> functionalities on the Qualcomm Eliza boards.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 18881bd239f9c53e74ad5caa492bace394e4fde7..dd45d275d30a32fd567432b5c324896518aa4ad8 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1458,6 +1458,11 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>>  CONFIG_COMMON_CLK_QCOM=y
>> +CONFIG_CLK_ELIZA_CAMCC=m
>> +CONFIG_CLK_ELIZA_GCC=y
>> +CONFIG_CLK_ELIZA_GPUCC=m
>> +CONFIG_CLK_ELIZA_TCSRCC=m
> I told you already twice, don't send duplicated patches. Once when you
> sent sm8750 videocc, even though it was all ready and posted. Second
> today when you completely ignored one month of development of Eliza in
> Qualcomm tree (so your tree).
> 

The intention was never to enable TSCRCC, it was more of other Clock
controllers. It will be dropped in the next patch.

> Now this. You keep sending patches interfering with work which was
> already posted.
> 
> NAK
> 
> https://lore.kernel.org/all/20260316-arm64-defconfig-enable-eliza-basic-providers-v1-1-7ae581670aa8@oss.qualcomm.com/
> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


