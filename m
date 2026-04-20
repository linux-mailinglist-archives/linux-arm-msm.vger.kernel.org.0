Return-Path: <linux-arm-msm+bounces-103758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK63HVog5mkMsAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:47:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A942AE99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B0C0300C034
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DB1390212;
	Mon, 20 Apr 2026 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odQeOqTC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ym5eU/Nv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEF017A2FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689238; cv=none; b=sH7Mw199JByRe291eK/qX8zGpEbRgtA0UUgZQ2ZTp6bBmp2jRhyCE9hIintMPs2ALJ0zMhSVIQROSKXBq/skHp6plNYXX89wiO4/3N2mG9UytNV2fdgfTdGTMZja4lWqA8oXwSEOROSdXzlCMUjgizMoJYo43adMaW5FgRqxP7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689238; c=relaxed/simple;
	bh=Sa0eJ2+ds/b4yKfHQWidhYvH4TaUEonQgaTOa8J0p00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rtsqn12q2l0QgIoO3vV+HzdGch8zNWnicOaB0+jqGluVPMS067t0cqCST5vuVsfJeow/SD3QEvH7YQYQwVzECayZ0uwoiZ88xXXCioXDgMKprx6uzRddILCIB322eiSGjMzXAayBEp5nb+EmXduZImHZIVbjWjQt9kTzTLfhBNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odQeOqTC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ym5eU/Nv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvYdu3015375
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVPaeYg11gyyFWeOCVrgy1G2LdNPX1VCIqbDxazwsZ8=; b=odQeOqTCBf4kjmv7
	734NYINivvULlfsoEvEPVWex0S6E2wHVvMmegMkCF/aRmhusLpYoHo6IJvYGpXlB
	nM9UskhX56crE1D5WFZQj/h4srTg+xDg4LP2a9K32AZPR1X9V97SB9JL7U+XnOHX
	szsqbRnKuG4JnxJl7ljv2aP5tjqQvYQzBWF4glKREsQFvz4FVSN9OzZt4gGjRF3m
	Fhpo3bL7dM+PSzIGsiOF+DY2aioUUzwZKNVHG1mq3vDeBA6SCmR+YaJUzt4KqHwA
	6ssTBhoCdGdQbLkTd9Pi4CtSylJnLeOTFnKZveLS8b7OxTj3y8ma8rYbV6i01LT0
	K+P+qw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjukrath-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:47:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c798fc1a426so216005a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776689235; x=1777294035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVPaeYg11gyyFWeOCVrgy1G2LdNPX1VCIqbDxazwsZ8=;
        b=Ym5eU/NvMO/0JbtLHX6WMz5c+i3gd8JEQoHStM59Tf7kZWHnKfTiHe54eZHiFsy0Rb
         TMBHLf3Newjs+CopGrBp/+3V0HNM7NhvbCZZ1SpFHbpU4odY7m1CskPmi5TGME+Jy+jc
         Bx6aPntG8x39sWKLi0zUXfGrwS0lvpyMtVnRfLcxKEnAP1MCxIBSbXUifIPiaoORtBIh
         B47ncpiCYVNlFpcj7XUr4p5rHqipmlhRJxi2bnZBzS5TVVqF8AULth0RhNue8V6SbVOW
         EEahOn3AXpS0ANsTzNtuCZCTn2pCa55WWduU0gbuFT+G1eB9TzB3z/SFipJTPeGRmkCq
         b7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776689235; x=1777294035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVPaeYg11gyyFWeOCVrgy1G2LdNPX1VCIqbDxazwsZ8=;
        b=HixWnQ0MEYF7NDK0pm06pA9+mUO8MIMDJs7M6XIAm4+GeQXyxXei0ZOuPjZzknIB4E
         An8U2jMJ7XB7i2HfL2hw5drS1dE37k7eA/uvWwfdIadB9a+Ct2XNLdXIdALzu+KisWU3
         J4LTKDNzj4cuFyyY412n1WW/nQ3so5KhiNZRLWOyoC+p/bRsaLogP2QvTe40ylKe/7Eo
         t4K4kQ0+mOa977M2NYQ+spANChFVcDJvphitnBLHLaygVLBBx2644h4ZjwwAuBRMOa8Z
         AMrxTn/vo7RmFg8CsipM2gRa7Mh4BuzjHx1YiAf51hH51wp8iwOeYEilwQCAyEuQQm0B
         3lwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rwKPdz/dB+C4eFrjNQU7AXB4QL+FQW/YD8fN5xWzqwE5yTgvQ9DiMKl4GxSR54Z8cmqd1+FgTJDh7LpJq@vger.kernel.org
X-Gm-Message-State: AOJu0YyqgOtQpuX/bh4E3fUwPX+4JJggZQk8GAAPkUaUbulch4kXpOtH
	HlRXATPFnR8vZybhGArjY36MdpNBA580DDwcEfdboRNtl8QomDTgRUYpZ3dPfp5a6I7JgIVsMxm
	ZAfam+fo4/S1Vd0H03NkrtSWnCdFXzDywSv7V4s0NSOvwnhzpxQvITc+wDWA7icOyJ8su
X-Gm-Gg: AeBDievIrogdaD84F1nBh/GZRlInihoV3V7rEeLpNcSrG2RBUkbB16qGXDEoZVY3O7s
	IQMMYj/UJx3+E599vI63yyxw1XVbRamGKz4s4XauDeBgHLFYYdDgM7HCYiJE/pL+rKULFz4y3dB
	3rWbpkxQV7MVIzb96UTh/T4BEq3jiJzTarJrGpSOJHGZWeIKhUUXj9IWO8KUDrNbf5lOAyHWaQn
	b66tXJ1JcNh8nD0exH0jnqNoG6WZGM95vtMPqpl7i3hFVNm5YDQWMPnfYbQxmP60EnKwYUBkltL
	5GLvYcO0gMOz4YME3U4WdREaoeosLD0YeqdmQYscW6rj2Xw5bvTazsWQCwTckDV5nVPKPcwetxW
	t1MaHjBKKT5HfdoXU0ictfb7waGDBSCXPiyDPC/hH5CXuhbQ42jaqWJrn07De+GqTLWBazt3ogW
	rylJmOYPkFUQyy/AB8axS54AvQBKAi
X-Received: by 2002:a05:6a00:2d8d:b0:82f:38:a5b2 with SMTP id d2e1a72fcca58-82f8c99aa1cmr13782109b3a.40.1776689234487;
        Mon, 20 Apr 2026 05:47:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8d:b0:82f:38:a5b2 with SMTP id d2e1a72fcca58-82f8c99aa1cmr13782088b3a.40.1776689233925;
        Mon, 20 Apr 2026 05:47:13 -0700 (PDT)
Received: from [10.133.33.141] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3fa2sm10626546b3a.29.2026.04.20.05.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:47:13 -0700 (PDT)
Message-ID: <fffa03f6-82c5-4d87-9a41-19e6f82ec39b@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 20:47:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: qcom: edp: Add eDP/DP mode switch support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
 <islxoe4wbqx5pl54difetdcl5lrqvfd5ysbaicxz5lv235sfmd@6hwrq3rmqx7c>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <islxoe4wbqx5pl54difetdcl5lrqvfd5ysbaicxz5lv235sfmd@6hwrq3rmqx7c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TvKC-60EpAADZrLeOv-JAu9lvKpFCfAY
X-Proofpoint-ORIG-GUID: TvKC-60EpAADZrLeOv-JAu9lvKpFCfAY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyNCBTYWx0ZWRfXzdhT9mmaqY1h
 QQzgxQ3sF3Hb7rrv/ifXXs8Wf3dPK601/rznEyoCySafHtUwh+1HL/sYQe2nbUzjDHTiedv5cNg
 ozaQYsPUszklcdgwDOMQpQQU6SOvLTaNKFFigMWJemqbMZOpK5jZh0Lye89Fcy89GRApHi1caO/
 z0Ao172NL8tWrsKaMPWWaRjuMKLus6qpCAj2cLL8zjhQ5hd30msw1+BKLSLdCdGqof9Q1X8RdfM
 penkdJ8vyn4cZDbXERny4OC2wH90H3q/WSpJZHDhdODqp0a7Zg7vt3Drd/3sEEY7+n4fa4unjkK
 n5yIYpkWPsL00CpFCe2BAxpsJS+JyL2dlUw4yiXicFZ0d6az+ZOd+CTUWeMO80s7rRIcrf8dLHo
 BS3lL5DlKNcZuxEXBjudt0LXUFT1Mw5aBAUh+DWiyaar/JDQCNfpcyxCsjibnoDhTOLY1EIXget
 9hm/TJ7l8w1qkRszdTg==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e62053 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=k-2n-EVLw8xsGkUqXZEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200124
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,infradead.org:url,infradead.org:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103758-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 131A942AE99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 2:36 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 04:28:29PM +0800, Yongxing Mou wrote:
>> The eDP PHY supports both eDP&DP modes, each requires a different table.
>> The current driver doesn't fully support every combo PHY mode and use
>> either the eDP or DP table when enable the platform. In addition, some
>> platforms mismatch between the mode and the table where DP mode uses
>> the eDP table or eDP mode use the DP table.
>>
>> Clean up and correct the tables for currently supported platforms based on
>> the HPG specification.
>>
>> Here lists the tables can be reused across current platforms.
>> DP mode：
>> 	-sa8775p/sc7280/sc8280xp/x1e80100
>> 	-glymur
>> eDP mode(low vdiff):
> 
> Separate question: should we extend phy_configure_dp_opts with the
> low/high vdiff? Is there a point in providing the ability to toggle
> between low vdiff and high vdiff?
> 
Emm ,i haven't found any platform using high vdiff so far, and I'm not 
clear in which cases switching between low and high vdiff would be needed.

>> 	-glymur/sa8775p/sc8280xp/x1e80100
>> 	-sc7280
> 
> I understand your wish to perform all the changes in a single patch, but
> there is one problem with that. Consider this patch regresses one of the
> platforms (I'm looking at Kodiak and SC8180X as they get the biggest set
> of changes). It would be almost impossible to separate, which particular
> change caused the regression. I'd suggest splitting this patch into a
> set of more atomic changes. E.g. the AUX_CFG8 is definitely a separate
> change. Writing swing / pre_emph tables on Kodiak and SC8180X is a
> separate change (or two). Switching each of the platforms to the
> corrected set of tables ideally also should come as a separate change,
> so that in case of a regression the issue would be easier to identify.
> 
Thank for point this, will separate the change.
I mostly overlooked SC8180X here, since I assumed it shares the same PHY 
as SC7280. However, they are using different PHY sub‑versions. Will add 
proper support for it in the next version.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 90 ++++++++++++++++++++++---------------
>>   1 file changed, 53 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index 7372de05a0b8..36998326bae6 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -87,7 +87,8 @@ struct qcom_edp_phy_cfg {
>>   	bool is_edp;
>>   	const u8 *aux_cfg;
>>   	const u8 *vco_div_cfg;
>> -	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
>> +	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
>> +	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
>>   	const struct phy_ver_ops *ver_ops;
>>   };
>>   
>> @@ -116,17 +117,17 @@ struct qcom_edp {
>>   };
>>   
>>   static const u8 dp_swing_hbr_rbr[4][4] = {
>> -	{ 0x08, 0x0f, 0x16, 0x1f },
>> +	{ 0x07, 0x0f, 0x16, 0x1f },
>>   	{ 0x11, 0x1e, 0x1f, 0xff },
>>   	{ 0x16, 0x1f, 0xff, 0xff },
>>   	{ 0x1f, 0xff, 0xff, 0xff }
>>   };
>>   
>>   static const u8 dp_pre_emp_hbr_rbr[4][4] = {
>> -	{ 0x00, 0x0d, 0x14, 0x1a },
>> +	{ 0x00, 0x0e, 0x15, 0x1a },
>>   	{ 0x00, 0x0e, 0x15, 0xff },
>>   	{ 0x00, 0x0e, 0xff, 0xff },
>> -	{ 0x03, 0xff, 0xff, 0xff }
>> +	{ 0x04, 0xff, 0xff, 0xff }
>>   };
> 
> I've checked, at least this table doesn't match SC8180X configuration.
> 
Got it.
>>   
>>   static const u8 dp_swing_hbr2_hbr3[4][4] = {
>> @@ -150,6 +151,20 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
>>   	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
>>   };
>>   
>> +static const u8 dp_pre_emp_hbr_rbr_v8[4][4] = {
>> +	{ 0x00, 0x0e, 0x15, 0x1a },
>> +	{ 0x00, 0x0e, 0x15, 0xff },
>> +	{ 0x00, 0x0e, 0xff, 0xff },
>> +	{ 0x00, 0xff, 0xff, 0xff }
>> +};
>> +
>> +static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg_v8 = {
>> +	.swing_hbr_rbr = &dp_swing_hbr_rbr,
>> +	.swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3,
>> +	.pre_emphasis_hbr_rbr = &dp_pre_emp_hbr_rbr_v8,
>> +	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
>> +};
>> +
>>   static const u8 edp_swing_hbr_rbr[4][4] = {
>>   	{ 0x07, 0x0f, 0x16, 0x1f },
>>   	{ 0x0d, 0x16, 0x1e, 0xff },
>> @@ -158,7 +173,7 @@ static const u8 edp_swing_hbr_rbr[4][4] = {
>>   };
>>   
>>   static const u8 edp_pre_emp_hbr_rbr[4][4] = {
>> -	{ 0x05, 0x12, 0x17, 0x1d },
>> +	{ 0x05, 0x11, 0x17, 0x1d },
> 
> This was changed only for Kodiak. For SC8180X, I assume, we should be
> using the older table.
> 
Emm, for SC8180X, eDP low VDIFF (High HBR) only S1 (250mV) P0-0dB 
Emphasis Settings "0x08" different from other "generic" tables which is 
"0x0B".
>>   	{ 0x05, 0x11, 0x18, 0xff },
>>   	{ 0x06, 0x11, 0xff, 0xff },
>>   	{ 0x00, 0xff, 0xff, 0xff }
>> @@ -172,10 +187,10 @@ static const u8 edp_swing_hbr2_hbr3[4][4] = {
>>   };
>>   
>>   static const u8 edp_pre_emp_hbr2_hbr3[4][4] = {
> 
> I think it becomes worth adding version to the "generic" tables. They
> are not that generic anyway.
> 
Got it. SC8180X here need a different table..
>> -	{ 0x08, 0x11, 0x17, 0x1b },
>> -	{ 0x00, 0x0c, 0x13, 0xff },
>> -	{ 0x05, 0x10, 0xff, 0xff },
>> -	{ 0x00, 0xff, 0xff, 0xff }
>> +	{ 0x0c, 0x15, 0x19, 0x1e },
>> +	{ 0x0b, 0x15, 0x19, 0xff },
>> +	{ 0x0e, 0x14, 0xff, 0xff },
>> +	{ 0x0d, 0xff, 0xff, 0xff }
> 
> Current table indeed doesn't match the swing table. Please take care
> about the SC8180X differences (I think, it will need separate set of
> tables).
> 
Got it.
>>   };
>>   
>>   static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>> @@ -193,25 +208,25 @@ static const u8 edp_phy_vco_div_cfg_v4[4] = {
>>   	0x01, 0x01, 0x02, 0x00,
>>   };
>>   
>> -static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
>> -	{ 0x05, 0x11, 0x17, 0x1d },
>> -	{ 0x05, 0x11, 0x18, 0xff },
>> -	{ 0x06, 0x11, 0xff, 0xff },
>> -	{ 0x00, 0xff, 0xff, 0xff }
>> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
>> +	{ 0x06, 0x11, 0x16, 0x1b },
>> +	{ 0x0b, 0x19, 0x1f, 0xff },
>> +	{ 0x18, 0x1f, 0xff, 0xff },
>> +	{ 0x1f, 0xff, 0xff, 0xff }
>>   };
>>   
>> -static const u8 edp_pre_emp_hbr2_hbr3_v5[4][4] = {
>> +static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
>>   	{ 0x0c, 0x15, 0x19, 0x1e },
>> -	{ 0x0b, 0x15, 0x19, 0xff },
>> -	{ 0x0e, 0x14, 0xff, 0xff },
>> +	{ 0x09, 0x14, 0x19, 0xff },
>> +	{ 0x0f, 0x14, 0xff, 0xff },
>>   	{ 0x0d, 0xff, 0xff, 0xff }
>>   };
>>   
>> -static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v5 = {
>> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v3 = {
>>   	.swing_hbr_rbr = &edp_swing_hbr_rbr,
>> -	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3,
>> -	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v5,
>> -	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v5,
>> +	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3_v3,
>> +	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr,
>> +	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v3,
>>   };
>>   
>>   static const u8 edp_phy_aux_cfg_v5[DP_AUX_CFG_SIZE] = {
>> @@ -262,12 +277,7 @@ static int qcom_edp_phy_init(struct phy *phy)
>>   	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>>   	       edp->edp + DP_PHY_PD_CTL);
>>   
>> -	/*
>> -	 * TODO: Re-work the conditions around setting the cfg8 value
>> -	 * when more information becomes available about why this is
>> -	 * even needed.
>> -	 */
>> -	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
>> +	if (!edp->is_edp)
>>   		aux_cfg[8] = 0xb7;
> 
> This is a separate fix, as it changes the aux_cfg[8] value for Kodiak
> and SC8180X.
> 
Got it.
>>   
>>   	writel(0xfc, edp->edp + DP_PHY_MODE);
>> @@ -291,7 +301,7 @@ static int qcom_edp_phy_init(struct phy *phy)
>>   
>>   static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
>>   {
>> -	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
>> +	const struct qcom_edp_swing_pre_emph_cfg *cfg;
>>   	unsigned int v_level = 0;
>>   	unsigned int p_level = 0;
>>   	u8 ldo_config;
>> @@ -299,11 +309,10 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
>>   	u8 emph;
>>   	int i;
>>   
>> -	if (!cfg)
>> -		return 0;
>> -
>>   	if (edp->is_edp)
>> -		cfg = &edp_phy_swing_pre_emph_cfg;
>> +		cfg = edp->cfg->edp_swing_pre_emph_cfg;
>> +	else
>> +		cfg = edp->cfg->dp_swing_pre_emph_cfg;
>>   
>>   	for (i = 0; i < dp_opts->lanes; i++) {
>>   		v_level = max(v_level, dp_opts->voltage[i]);
>> @@ -564,20 +573,24 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>>   	.is_edp = false,
>>   	.aux_cfg = edp_phy_aux_cfg_v5,
>>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
>> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
>> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>>   	.ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>   
>>   static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>>   	.aux_cfg = edp_phy_aux_cfg_v4,
>>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
>> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
>>   	.ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>   
>>   static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
>>   	.aux_cfg = edp_phy_aux_cfg_v4,
>>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
>> -	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>>   	.ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>   
>> @@ -585,7 +598,8 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>>   	.is_edp = true,
>>   	.aux_cfg = edp_phy_aux_cfg_v4,
>>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
>> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
> 
> Ok, we are going to continue using eDP table because of is_edp = true.
> 
>>   	.ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>   
>> @@ -766,7 +780,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>>   static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>>   	.aux_cfg = edp_phy_aux_cfg_v4,
>>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
>> -	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>>   	.ver_ops = &qcom_edp_phy_ops_v6,
>>   };
>>   
>> @@ -945,7 +960,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
>>   static struct qcom_edp_phy_cfg glymur_phy_cfg = {
>>   	.aux_cfg = edp_phy_aux_cfg_v8,
>>   	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
>> -	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
>> +	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
>> +	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>>   	.ver_ops = &qcom_edp_phy_ops_v8,
>>   };
>>   
>>
>> -- 
>> 2.43.0
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 


