Return-Path: <linux-arm-msm+bounces-97911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA7gGHLft2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:46:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB3B2982B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B162530098B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB9A29E116;
	Mon, 16 Mar 2026 10:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SitWOfax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qbvqu0Lz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9D38F93C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657966; cv=none; b=DHVBNKF7RsFeQ5nACnYJgyFAsF8+p+H+1uDcGe7LvcOOQBVCAIFGuC9eeu5GlHa70KrBQAnScabS4OoUTnwVz+k/kXORNP6VhTjiKcaQwrODSiOQv3FfRyUTNRUX0y1kLNMRnwzn+m7+SV4kfJHAyCpfP26SN+aHN41MY2DJs4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657966; c=relaxed/simple;
	bh=zfkAtaks8TnTGZoseOdB4Sa47JX+p1bUlJg+ldlxrkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNAmKe3Z6lrxY+ml+yYHZyNkSKyCmBP2HjEAq492e4ztkP3GJl2ZxSR1+r6OOtp9gIDX6iW/agPzv3x9XkuxG9mg6C+8qa0EU1aMHuOfOOAi6nVyRshAJ4xa0rEb3uSTcxdaTjY14x4Pu+10tRRKlsu6FSe6kDI3rNyDSAhxhLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SitWOfax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qbvqu0Lz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G6504s2129273
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E5HsmY6Th9CL3tlgqtolCjbK00YEQZ72hvEx8QM+PtU=; b=SitWOfaxiWQj5ITT
	4Pg40LQQqS1JmtiO/O6evt1vjZ7pox9pQz1VIPsMqdSRzujGWRzQKmNqqse/d7aI
	DNR5Vi4VJVCYGUZcqjtkk4XTIubCAgttzCh5axFn+F/lGvU6EsYslFo4nrNaLsDQ
	QsXd06KuSoL/dPF8xsS7RoVi4Q/4BDzNrOtQDPGh3L9xTW0mFfRXO8B3teCekWgd
	wQ2EFqkjSHPDKNtLc+Nl71mKO8VUWGzjXgaEEeTgBbCEC6spXZ2FJHN97HDF/jOn
	x9mqQhCYWsYZ7kqJtOxFtpbsSYv7gyCtQ8eWViTlZeo8bPS/BiWzVy/n+a2+sxfJ
	TuoU/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00anc4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:46:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd97debc51so348986785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657963; x=1774262763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5HsmY6Th9CL3tlgqtolCjbK00YEQZ72hvEx8QM+PtU=;
        b=Qbvqu0LzUeMyzEzSmbpIpefit4Ce5OnRMUwhLEKa+lIzp1i5gE7o21Np0h2Wlrw9nL
         hujq9repdiOybXIAu7sP5yxdOLEEapSevwhXua4nJWQWgrxGW2bCVXwS/0LAzlCnxxG2
         JuZA9Hq2yYfjxK68LA0dhx65PsLPt6fU2W34qwwk8ICwXuDefPtHa2alfrXHDbNm3L/s
         U9icmh8T/Y1+axMryCixdRNUQsnUP4pMAdRdIuUDClEGCEmUG8RAdLSmIc03ohUN9TSH
         qtRXPvr9/eekLMIGH/JplQDpMNMqGvjcaKh8e6cqnNTk0pR2fyo6AKKA4TgwVJHuhl8V
         F9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657963; x=1774262763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5HsmY6Th9CL3tlgqtolCjbK00YEQZ72hvEx8QM+PtU=;
        b=qlIl2icK2DD/ntLfw+QqlJKKCmFtsNfR7eVPhQXTJN2PRTZxsxdGWR3nOaaVuqX7b8
         bIBc9jhH0lji/FxCpx615zaxBSIRW4D0NIIVw2hjrxQ8alM18jRw391HQXYuw8m3FxTz
         Ir4n5rSAPtyC/wKW9f6RBvmu0uL5uUspA5L+IK9a//i6N1uu7tAdHjWJ5L0wTG8rV02L
         Luj1hF92/SWQYseHXLcIeLO4Q4iZJD/LFkA/x5l0S9RqAEXFnC/RtaX77YW+bEUVP/5i
         44kUB964CGVzTVeJUR8wAZQLeJpefMWJBqHK+F7YhXzCSNwKwd0m8Shy1lqDh16Nij55
         WlUw==
X-Gm-Message-State: AOJu0Yx7Vhm3YKmOkpwLONPdvZJFsPz3iXkmJwQ4g93WDUSldOIrPqfw
	Xx2+2TtYLNg32/4R/alSSnURA4+7hfZgLJp7Rl5eU30bKn4zmWjZzoVVWCleZp33A5Ccf4OYpc7
	mNvsdj9sh2nNGXcZ7TIiESZSU66CiHVS48Ua30LetpVGA92sW2IOzvaz874lbvnKmygBLHucdU+
	iv
X-Gm-Gg: ATEYQzyXp3Ho0rkN95kyQg8/pujDKYTxm/iJVNzDmPg8pBcDe214BLmDQ2Me1uvChcD
	VA2PDR+WNDgeUe7ZSuRFIKzfIaMCH0x5Hl2vn/jaUGTjtaIRkAZJYShgRO07eujHX5L6g1lK/4U
	GvKJv7y2+U1LSRHgkPNPf+w02PKo1fBNOrpkBkVmitNVFRG9cBCZB0V5Xw2sU8gw8QJESllTCmG
	oz/p57FzhzKAy0mJdC2YuzkfBzQqaj/TgZ3l+e6CgbZ/6aluc+/RE4abiCnaZK71ANznvDKR+NW
	bElzSZrX5zehwG6qum/7K/s9MGZY1aXndqokCG/IKY6UJbV2JPYfUMY0hWFgb1Tz7dwiDfXisAz
	VGjV8NUGRG4leXb4elIaZlwjTI4GHU6s2taLXit4sCKKhejxss75cQxkbktbgLYjQFeKkqnUOYw
	kEss4=
X-Received: by 2002:a05:620a:40d0:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cdb5b60335mr1300130285a.5.1773657963318;
        Mon, 16 Mar 2026 03:46:03 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cdb5b60335mr1300127185a.5.1773657962827;
        Mon, 16 Mar 2026 03:46:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350992e88sm4976671a12.24.2026.03.16.03.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:46:01 -0700 (PDT)
Message-ID: <3493e323-c666-4a34-85d5-fe5abb5fdc6e@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:45:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-5-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-5-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rv__JnNo4Cd8H0NNoo3pD4gCU5wx6aMy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX4nAM19/aWd8I
 xasTnh2c8tceI9L7lQzwBMLATFCIR7udZgQOORBqDql1SvIiJ84v5wHVrMxe49/L6/ITJ+mKNZ9
 HRIx0w+peGOUbkqnLQIkSdsciXgWsawNhCgB0pD5bLElbg03L8Sy4EfFTf4Zg5spmeDOaBtPANi
 pjlnKJLKQuO5mGed5pWYpH4Lv/Vrq8I5RuhXGLL3+LIv/HH8bzSWSA+T/DZC8fHHjhycuM0bAjN
 DoFC8h7f05RmlX21SKdmOCrjgj5NNeq6HJ5vb8BU/bVNPY9I0Qgj0A/ivauyASeFHYibaCg+xUQ
 vVGQz5Ul15Nj2lb/m+vwUwU4Gxa08wSbZCtppbQW1AbwnPnrg+qfFmLr75RE8B1yOJ8OJOxekJZ
 NEXvheuuRLY8RrejZwO+x0YRE3DPMOyvAeuqpR10CZcvC+MTEiq54BqCyPrgo1uBWYuHq/pt6Dt
 tu9DvnAiu0JbpMuNQLw==
X-Proofpoint-ORIG-GUID: Rv__JnNo4Cd8H0NNoo3pD4gCU5wx6aMy
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7df6c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7wtgjnKuI7ixzQLi8VAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97911-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4CB3B2982B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:29 AM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

