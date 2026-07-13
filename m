Return-Path: <linux-arm-msm+bounces-118805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hn55JOL7VGqGiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:53:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 176AE74C9E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:53:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e7z7dP4P;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jZNsV8hn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118805-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118805-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6408C3013478
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762354307AB;
	Mon, 13 Jul 2026 14:53:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D869B30E85B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:53:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954397; cv=none; b=id88xC5r7MTAd2el3yCcYGKNSOt3JW7id2M4VeF/LQaKd3uXSmAehxMua0AU30fSnIMxex9+1akw007B5tVMUFScS8kAbuGENPE1CWFWCn0+vtC8DkK0Or1QWOOps2HS74JmwveoUyRRRB0RiLsLtLL0CCYzfwZkmGAHByVXjBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954397; c=relaxed/simple;
	bh=cQqrPgm5KWN+3lP+JyMufT3CkYgAKEmk+qvMiYd5BaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tI9XnNJjq2cgwhJKrxmY1H/tScWfaU2cL2gZasdU/QAt1hSyep3Yw+6WLTurttbRQ93Y+BUz3eOlCaq7bjSXdxM+zPt8E7wNlwdFuSvD07um+CsX7r1ihvDexXd160f2XvcWU3LBTqdnsgVfFQyxixbWbczYFkdkt1O2QDErdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7z7dP4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZNsV8hn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDug51209908
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=; b=e7z7dP4P6kZ+hpy8
	zncf2bbzSinENaM22HojqRVcfDEa6yLFu4UbvOg9zW13JZQeBQcOWTG5mF4mDHwB
	/C0uCB8Glz6oE7/1rq8TeNEoaeua2CIno/sMsSZkUOOGyM1F45lVBmbEkk3Ps7uc
	vWwG1x/0IDHznPKkBH/lqD47NIogvsQALrI8Sjmew4xV0Ld+isbk1VTowEilEN34
	j1GmRQeZ/y+f8IaBu1qxaZ5Hs7+flE3kPl/9E0Td58cKL2kY9Hop5XWkuNZzvGwk
	W3+w8jsS2TEW3baDkBsNROHTs6p6yfNVXQAGDdNM86Ds3UyB+/vkdhZoN34USvMj
	x3TKFg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qsayw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:53:12 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-49f3a97f1caso3506918b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954391; x=1784559191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=;
        b=jZNsV8hnwvqrRps5f0qq9wuXtZte68aOHdPGi8asQAvJgIXGh4fDBrbPg2AmQZqG6E
         bpub+KmauKVdZQInYxCRLfaHThWGIW6oC2Y5eGSgU1bvckpoVia+djT7VZKg2v5M/XTY
         fpkZSyA0aYjEWQRdHpPLZ5ad0jt+VuN98mPYWxku/rKVvh7qY2UwfISahE/gdmz4Pps0
         iRtbWrnEowxTxuvIeHVSvpjVFiMI8wxK6mSpHTNBmx96tBV7XATgP+YvWGKqRRClOQfq
         6PlL21600SJbBhajPz5lolj8Y9qJxPerKWYCrRFuyiFHwxBrMW77ihUKKfNgc9j9KCJG
         7zRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954391; x=1784559191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=;
        b=Q42CnQb9wEZBArjL0o4/RnuU52TcwI1h5kZH8e0RSVOT3uY03jcHA+C2X83FuKjfoD
         fvofmpVBVFXLEYcjJhDVqg7rbu6pX4emNLYgUSkFYksPYtJp9NFs4LiUCnpg0f9vYkxs
         vb0QnSL7duhe+HyLAkPArHLpA1JsI6nWrrYxLKmb9hfSlaXaBKNiQi92cwg4t4T68+0c
         jmq+HLVAI4ZjpN56/x/7tggr5BI6DbsLZJk5UCsfafziKYqqUkBXNqWlqnIWT2QGoXTr
         oq414AConU98ElHebr95muDBcXHKQqiJjWSbSx0e6gHs9EiyB+j5RF0OaJc2W3rDgFbq
         gM2g==
X-Forwarded-Encrypted: i=1; AFNElJ9Rm71Ans/1BOn7DhlyJvcL6u5hEMZM3cA381Ksd2rl2y3h5AF/KQweNie1HbvYyOVGU/kKb848bxJTqFQd@vger.kernel.org
X-Gm-Message-State: AOJu0YyifokxvMFMZZF7pSGH6SochXLrTRJDcDHtCBJzexiU+ikp1ErL
	Io2Yww4u7J3TdvlVsVUsIqLM5NicNOfByzY0rqDyJH8l9Gh66CL87tlMaV5oD1IJ6sdPrWAfkLX
	KD8QdY28Afm0L7IJKyf5kp0hrOH6M53i+t3vGIJ46nI5SosVjn7xpE+KXMwnatecF/4Ee
X-Gm-Gg: AfdE7cnvkOzkwXLuyV/YDIQ6LVPW0Vnewav9gyKRGB229rOR5KJz0WnVowGe4ctY6ws
	SmE+TgoZrz4/Otcdmk2lOgyxmJdLl3/kLmtULlxLy+JuQ2K/zocGc2cj6jiz/k+v3y23Aywa7Io
	ehUdA5Vkv3h200SWKxegFF3KWrjy3SYtL8HsFOzNWfA6392P1miTiIS2xca1+wwvmQnZODHU4ut
	JYO+YaF7u2sfoInRIwsOumuq7Sw0YBLJPkwUE/ULRa00Et+3INxdF+QPDicbkG8jAZHXTFW1a9Q
	+WJmIFTumXbUvHl8uEDPX+/Tj3I43wFOZq9ZJEX3eFV0HC6C8NfNvMq+Yz21HJW7wN9/jnG94lJ
	kD7zYL6PATbVcBkOPAQ4Yq/g5zxW6ZLkiy/9iiS4=
X-Received: by 2002:a05:6808:190e:b0:495:db8f:ded8 with SMTP id 5614622812f47-4a42abc07e5mr7016396b6e.9.1783954391351;
        Mon, 13 Jul 2026 07:53:11 -0700 (PDT)
X-Received: by 2002:a05:6808:190e:b0:495:db8f:ded8 with SMTP id 5614622812f47-4a42abc07e5mr7016378b6e.9.1783954390885;
        Mon, 13 Jul 2026 07:53:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm11978085b6e.0.2026.07.13.07.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:53:10 -0700 (PDT)
Message-ID: <797cce6f-850a-45f1-81e8-a1cb97c6a9f3@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
 <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
 <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX3NBjuA6BJZ+A
 qPyeTmotw3g9EORKHbkPZOV1Rt0NcqtKPo8pGSvz5s6ES70uvYXkDgSxtpD+rCZBVWCCzYE+jY0
 8sOt22303kmHdICpQVL18yHeClS0MAixE8rRLS5GDcJDy+oDWCwk0bghNwg6U0TN0JFYxtqmWaI
 7WGKxyh65U0//dOlK3oN2LeAzn/rLjWIDAbhEY5yQWU/zl9232WoOvgHuZkUIPTDWbUx0qJh5w0
 050LaKlnDrGUPMheTvCdbCgUsKnp1AGcjZve+5c96S4rM/RB5GqGxIh7mAPzff+nz9iekNvqCOQ
 tBhs0j3E2oO1n0pfW8E1qelFxV7yMljNrRuWN+6bCRCqQ4ZD6M3yQRb5RSviHwNMkaPJ6/2e2nh
 qoj083Mvm/EEzFT3+6+qYS/Yx9B8u5zcueb6M3Bcl2jYBVt5p9JxHW7fK+A3cOL/38cxrS/MkqN
 sj9xDW7lTcjVw4kMiQA==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54fbd8 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Xoi8Q9uR1wpgCRNIeB3xeA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Qo9p9QJxbvv4IUk4TH8A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: CnjV64fLm6raaMq3RpsHU78hST8ZTyu_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXzNRQz6jyNyrt
 IMyhfydlUudXi4KxncWVCmlXJ0+9NzsRmQ5WkiRU35ReUryoVA927+5jVYuWve6So6doSgZ18yy
 M/z8E74y99lKZAAxjz2H8sVp8BslZiI=
X-Proofpoint-ORIG-GUID: CnjV64fLm6raaMq3RpsHU78hST8ZTyu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118805-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 176AE74C9E8



On 7/6/2026 6:36 PM, Konrad Dybcio wrote:
> On 7/6/26 7:28 AM, Taniya Das wrote:
>>
>>
>> On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
>>> On 6/9/26 5:02 PM, Taniya Das wrote:
>>>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>>>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>
>>> Almost all of these nodes lack power-domains, meaning the
>>> aggregated performance state requests will not be translated
>>> into RPMH requests
>>>
>>
>> Konrad, all the clock controllers are on CX, similar to Milos and does
>> not have any special voltage requirement for the clock controller.
>> It is okay to not map the power domains here.
> 
> I don't like repeating this every two weeks, but each consumer core
> may need a specific corner for operating at a given frequency and 
> the way that is conveyed upstream is via a hierarchical structure of
> pmdomains, where the root of the tree is provided by the rpmhpd
> driver
> 
> If the connection here is lacking, every requirement specific in the
> OPP table or in the IP node via required-opps goes to /dev/null and
> RPMH may do something between aggregating to a lower state (because
> there's some other node voting on it by pure coincidence) or shutting
> the rail off (because there's no votes whatshoever)


Sure Konrad, will fix them for Milos and Eliza and will submit the next
patchset.

-- 
Thanks,
Taniya Das


