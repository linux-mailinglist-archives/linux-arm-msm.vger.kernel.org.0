Return-Path: <linux-arm-msm+bounces-111201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rAupIx9yIWoqGgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:39:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BAE63FF37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:39:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mainlining.org header.s=202507r header.b=paFWhExG;
	dkim=pass header.d=mainlining.org header.s=202507e header.b=+M4nbtGk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111201-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111201-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mainlining.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66A5D3002FBD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACD1466B74;
	Thu,  4 Jun 2026 12:33:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246B7466B44;
	Thu,  4 Jun 2026 12:33:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576435; cv=none; b=EwNp0q6dLB0GKkwY4lG4Fg9iZNNO3NX3MY3KvqWETCAaS/Cb9ivLoSOZJ33Dy1eauFOxMtXNelrzom9svn5r6tesY2+hP7Gq8bZ8I2HrPCmfY1V76SPNWTrJEcNGi2IdJywnJ2NXjaXUOrAoKGbuBALX2NtGjO5l0GQGtjVJPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576435; c=relaxed/simple;
	bh=OJ3Uqeo1IwOJW6q6880uQtHS9eNIQRcj3ScJXz4WdBA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=RuEzXcTOLEw04K+0LjwtnN34nkgfb9HoPnnDQVh5g9rzJ+hUGXGZeb30k9MMCd/vHxMHY9rprCbXTNrOdQx6rR97+f/a4PJFvIVbYy6x0JVzCBdC8c0hVSL0CRTN7qKQdZi4f2Obt/pCGK5NMYaK3I6otHGkCiuHnHLAAYPb3dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=paFWhExG; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=+M4nbtGk; arc=none smtp.client-ip=5.75.144.95
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1780576420; bh=kU+i7g8pqOTCGjUW+H8X7o/
	tBXoM+LzHFNQrdKZ87oQ=; b=paFWhExG6MmKynuibQT97ubMi6MiMrQApDPN/SYJcqYXKGlc/c
	MKfUx0k+JTNU6L6Yub0lHAJNZMwCjVurPvmcLsNMmhp/b9oHKfJJJdxG2o/JyaI7kdhqeioTrXn
	AZR52fWixg1iCgx8cAyoXFtj4EC6zth5ZTyCYFLn9xNp+xgxbp8g0uPWKogIhG07Rr+fPqakB7q
	W87v0e7XSyYmTT3OD+TktXMw6NuhJ3igCFIIAxtCDBDr6KVN2C8iKNbi4FvZyJRrIldIbBLfHTD
	RU9y3ekoO7XlCppdeD+PffOX/vf7M1tLz/CWC6Ado7uGJsqWtKhXc6LH7vw0UfMPXVw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1780576420; bh=kU+i7g8pqOTCGjUW+H8X7o/
	tBXoM+LzHFNQrdKZ87oQ=; b=+M4nbtGke1FBzzH6cDhb7MIhnGK7ozUuqUnPCrz874rXusc+Ni
	CKwO2yRl6XjT8tVdHa4Kv5cuumyS5YyRp7Bg==;
Date: Thu, 04 Jun 2026 14:33:37 +0200
From: =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <barnabas.czeman@mainlining.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
CC: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/7=5D_remoteproc=3A_qcom=5Fq6v5?=
 =?US-ASCII?Q?=5Fmss=3A_Use_mss_as_regulator_for_MSM8953?=
User-Agent: Thunderbird for Android
In-Reply-To: <35e8f654-214d-4e8b-843f-87fa8cc1a782@oss.qualcomm.com>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org> <20260327-sdm632-rpmpd-v1-3-6098dc997d66@mainlining.org> <35e8f654-214d-4e8b-843f-87fa8cc1a782@oss.qualcomm.com>
Message-ID: <C5AF7872-093B-4039-9F3A-72BF855BB3D1@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.55 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	R_MIXED_CHARSET(1.00)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:ulf.hansson@linaro.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:stephan@gerhold.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111201-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:mid,mainlining.org:dkim,mainlining.org:from_mime,mainlining.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4BAE63FF37



On 16 April 2026 15:32:25 CEST, Konrad Dybcio <konrad=2Edybcio@oss=2Equalc=
omm=2Ecom> wrote:
>On 3/27/26 9:11 PM, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
>> MSM8953 MSS is using mss-supply as regulator what is usually pm8953_s1=
=2E
>>=20
>> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas=2Eczeman@mainli=
ning=2Eorg>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss=2Ec | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss=2Ec b/drivers/remoteproc/=
qcom_q6v5_mss=2Ec
>> index 4e9eb5bd11fa=2E=2E86edd826ede8 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss=2Ec
>> +++ b/drivers/remoteproc/qcom_q6v5_mss=2Ec
>> @@ -2705,6 +2705,14 @@ static const struct rproc_hexagon_res msm8953_ms=
s =3D {
>>  		},
>>  		{}
>>  	},
>> +	=2Eactive_supply =3D (struct qcom_mss_reg_res[]) {
>> +		{
>> +			=2Esupply =3D "mss",
>> +			=2EuV =3D 1050000,
>> +			=2EuA =3D 100000,
>
>I don't know if it's a typo, but msm8953-regulator=2Edtsi on msm-3=2E18
>suggests one more zero
I do not see any load values there only init-voltage what have six zeros=
=2E
>
>Konrad

