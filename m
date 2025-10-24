Return-Path: <linux-arm-msm+bounces-78695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C236EC04F8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 026B73A4C7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927102FD7D3;
	Fri, 24 Oct 2025 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8RmEPm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0182C2FD67C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761293048; cv=none; b=SF3nldkMKxdpLf5U3Ux13BsaaOHJ6fsz4Ac6rAnjaiSUxJk1SYI0B4pyyptL2zOnqiqR86GEWM0Lq2qTfcZa4QUi+e9l259qGDpLhMoJgM5uBzHIHZ5M4+UNKGZDXpBJYYCnXo10yQgIyCs0SA980MZyZSvsYy5ljlVXu9vtW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761293048; c=relaxed/simple;
	bh=5fNfGvab4opT7+M9+4gTh1brPpV0LMwCMnrjicPNLWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTsRNUxI4vKReuNkFX0a5+eofj/O2QxzRbBMGFiIYZA3Dbrdz0jvzZSDtfoFce3xXh+ifpKvFTI7fqe1sD6nXgEQXSWbVAIQM7tSyB4wNk3yKsC9t0aNi58Pki6z2dWmIBMYUQiY2xqj/gxAEdawVKIGvMOoqztdmyePN2Vtb6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8RmEPm8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FMj7020370
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/lRHixY5Nngi9VzXe+Ef0jXWxyKWxyYxZXM3NEjhCo=; b=A8RmEPm8bk9C9LFW
	e4krfDrB6inqBXLBKIZF+ahX9KY0JvPvTLAgVvIWlk4lsCOEYBbewcFTJY7u95ZF
	aATguBvwhaTsk3wzO4bSL2q9/xPB+hAH/IxqBnfDiJeUTlDpSw0PLC59r51cV6D5
	eYXq0SPHDCgtTgaGbOYLop5uBhmrfDryABVPHmTF0+JLL0YHVUcd3eL7z/D67IH2
	Z/hSFj0A/dA7hBRrSrHo919zU8+/Bnuts8S7bDtkkbAlkucPRvRZ75b0HfvtzGjt
	zRPcpFKytm+/QuvniXozFXqTP5JLdhX1CDBm21uRBFRSUPeN78lTLOBfQwRhSgA2
	PNA4qQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0s8p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:04:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5535902495so1120815a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 01:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761293045; x=1761897845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/lRHixY5Nngi9VzXe+Ef0jXWxyKWxyYxZXM3NEjhCo=;
        b=AgQaGoe0ICe6jFWRyPhYIFEpETW6UClDB696DHliO2vY8q2PkUf3j4j0BlY1lU1Boc
         J6mBC2j5TT/OOrmq7ctjcNW+52DmmNAZkG5l7Fj7QgR5n+9PQr2P4k3/SWpkn819Gjgd
         namcAl0IdeRMJc4w1bKhhuHl0gca9dUPuE0kLPi8O8Ja3DXYlF4tOevUeUfVjatVIG6f
         bNOi3xNSXygjqQgrv3OVw+NrVDuSaSt4w+K9hNdNS1Ww/Z+fT66qRH3qaHDvCeWvwuSK
         FfdXNeq3ERI/VP5HhX8b0G0OOk/PUjUooEQrPxOF0s0+zfgcyKCJ9GBV4Rc9EkT9thTl
         107w==
X-Forwarded-Encrypted: i=1; AJvYcCXprCNbOGQpZ+ubK0LibGBZAxoTc8Ey/D1WWZ+09/OoiJJD6bOkYEmb5OkPTNdkDN9HcRjJo1MV9TVEYTKc@vger.kernel.org
X-Gm-Message-State: AOJu0YxTbGetB7rOtW+1F3zbdTBaYXglsULlv89L7JqiD8p466u+lG88
	hEnC6N3IvlDI8opuekmniMHw82jP8eBFj590cJ5pyk0Uqj77Y8wd/BEoqTP31xdNHsh3A3FB/Ye
	+kchwzChg0MJXYttvnQrKva/eWqMkvjoN/2MrMCJ3Nw0xai0LVReYRuQZwfOxAvAmFJf1
X-Gm-Gg: ASbGncv4YRS1mq2MqRUsiCXhXK7iSChzcUNnilCmDuaUc3+idGvVfbiVyZ5rob1O0xe
	W+xsLmlWAxxgV8jtVOOaYsHjaHWZZdvy5d3lTzmnXpI6d9I972+DdahydXHk7GuqVDUMVCtfFtS
	IHmXo91myXyKV15HpLF+MTxLkUgDLxuvRJPqGT+12K44hORE3FZmS6CCUVW/qDyArq5YUpqv5JW
	p+MKHronq02if4HCxnMgmqZSw6egPx9Bd3zISlCgwaELHedHtaZ/xCui4W4zpJpx9GacnBnT7YK
	T7P5qZVHDfKqq9vayWnkhAhwcOK2TZbBVLtfQ0c7ski39+OAne3OHKumdZ5wLm5IjHXbbJqWH7Q
	9azPgSpeldPpZ6BDe2Fi4gDayotujX6bqG43+aN2sbbEfluRnN5/HqZlNdO7A
X-Received: by 2002:a05:6a20:3d8a:b0:2e2:3e68:6e36 with SMTP id adf61e73a8af0-334a8629dddmr34343900637.49.1761293044599;
        Fri, 24 Oct 2025 01:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF35NHW6xu5CI8mSOAYj2Vl5REzTdO/6tS4YtA3X5EIGWASTK4r2zlUt6ksnxa+VRSwtBWf1w==
X-Received: by 2002:a05:6a20:3d8a:b0:2e2:3e68:6e36 with SMTP id adf61e73a8af0-334a8629dddmr34343860637.49.1761293044088;
        Fri, 24 Oct 2025 01:04:04 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e224a2640sm8198763a91.16.2025.10.24.01.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 01:04:03 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:33:58 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] regulator: rpmh-regulator: Fix PMIC5 BOB bypass
 mode handling
Message-ID: <20251024080358.rkebbvg7louwbo6k@hu-kamalw-hyd.qualcomm.com>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
 <on4zcfs5qdaekc7teo2iq6vpw7o2mp6yiqjkbznxo7wcxgutj3@nb35f55fkugv>
 <61c299af-c4f8-47a0-8803-306c08792b17@oss.qualcomm.com>
 <xlki5jwurnixdxaph5mtxg7sfks2cww3xbswgtf6dbn2z72o2r@smx5hxo6obxj>
 <c3fac2a3-dc89-440a-9958-f2e904c42f5a@sirena.org.uk>
 <7wiionjbjot5psapobmwcflecyu7pz3pzc44c3horsvjfj6yfp@f2iig6hyb5a6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7wiionjbjot5psapobmwcflecyu7pz3pzc44c3horsvjfj6yfp@f2iig6hyb5a6>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX5x9lgLQQOYk1
 t35M9ztmt8uDdUtQqSof6kB0b7rF3e/XQwdKAWkJYKQDpHQdFTPPnnpatEybry8YAezDdWIcwLH
 fvmwPZj9Yk60IBpmiF0Ey62rEpYafrA43UZz2DQKO9hrl7VKP8NxhkuteEa/O63UTZzewtg3Ylf
 MXVSeyJ6ItlClny151Qt4NvdJV+QEOB7abMdor2dlkOYlo82E6mYUIURTyoO8v4iiK211VIwhHp
 tMKJK0phlKY++7F1Lwvy6J/t0Jv8voMQcKt5/JH10H2yLJb2xx5QbUmWlJzDw4JlG2J4hzN7NPV
 XoP+sUsQcRW9wg5rCUVtpQgS61P7vorw3OUdNpKxvl2BKeddscI99TuA5vgFQfMT1OFoi0i/L0k
 SgBxP9vF2odhO0SgGZ0kkr2IGhnqnA==
X-Proofpoint-ORIG-GUID: T5yC8XZOo1oGqqah43bWa1DIsYp6tveu
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fb32f5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=4voTl2E216AQtERj9a0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: T5yC8XZOo1oGqqah43bWa1DIsYp6tveu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On Thu, Oct 23, 2025 at 02:37:07PM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 22, 2025 at 04:15:51PM +0100, Mark Brown wrote:
> > On Wed, Oct 22, 2025 at 06:11:46PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Oct 22, 2025 at 04:58:15PM +0200, Konrad Dybcio wrote:
> > > > On 10/22/25 12:23 AM, Dmitry Baryshkov wrote:
> > > > > On Wed, Oct 22, 2025 at 02:38:53AM +0530, Kamal Wadhwa wrote:
> > 
> > > > >> Currently, when `rpmh_regulator_set_mode_bypass()` helper function
> > > > >> is called to set bypass mode, it sends PMIC4's BOB bypass mode
> > > > >> value for even if its a PMIC5 BOB.
> > 
> > > > > The universe will end, the Sun will explode and Ragnarök will be upon
> > > > > us. Please describe the issue, why sending bypass value is bad.
> > 
> > > > I think you misread, it sends the magic value which corresponds
> > > > to BYPASS, but one that worked for the previous generation
> > 
> > > I just wanted to point out that the commit message makes a statement
> > > that it sends some value. It should document, why the sent value is bad.
> > 
> > It seems fairly clear to me from the above that the driver is sending
> > the value for the wrong device type which is something so obviously
> > wrong I'm not sure it requires further explanation.
> 
> Okay. I'm sorry if I'm overreacting.
> 
> The bypass_supported field still needs to go away in my opinion.

@Dmitry - one way to avoid it is if i re-use `.pmic_bypass_mode` and
keep it  `= -EINVAL` for the checking if the bypass mode is not
supported? and drop the `.bypass_supported`.

But do note that currently only BOB type regulator supports bypass
mode, and this above change will also require modifying all of the
existing (and future) configs for regulator types that do not support
bypass control.

In all below 28 structures we will have to define
`.pmic_bypass_mode = -EINVAL` 

static const struct rpmh_vreg_hw_data pmic4_pldo = {
static const struct rpmh_vreg_hw_data pmic4_pldo_lv = {
static const struct rpmh_vreg_hw_data pmic4_nldo = {
static const struct rpmh_vreg_hw_data pmic4_hfsmps3 = {
static const struct rpmh_vreg_hw_data pmic4_ftsmps426 = {
static const struct rpmh_vreg_hw_data pmic4_lvs = {
static const struct rpmh_vreg_hw_data pmic5_pldo = {
static const struct rpmh_vreg_hw_data pmic5_pldo_lv = {
static const struct rpmh_vreg_hw_data pmic5_pldo515_mv = {
static const struct rpmh_vreg_hw_data pmic5_pldo502 = {
static const struct rpmh_vreg_hw_data pmic5_pldo502ln = {
static const struct rpmh_vreg_hw_data pmic5_nldo = {
static const struct rpmh_vreg_hw_data pmic5_nldo515 = {
static const struct rpmh_vreg_hw_data pmic5_nldo502 = {
static const struct rpmh_vreg_hw_data pmic5_hfsmps510 = {
static const struct rpmh_vreg_hw_data pmic5_ftsmps510 = {
static const struct rpmh_vreg_hw_data pmic5_ftsmps520 = {
static const struct rpmh_vreg_hw_data pmic5_ftsmps525 = {
static const struct rpmh_vreg_hw_data pmic5_ftsmps527 = {
static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
static const struct rpmh_vreg_hw_data pmic5_hfsmps515_1 = {
static const struct rpmh_vreg_hw_data pmic5_nldo530 = {
static const struct rpmh_vreg_hw_data pmic5_pldo530_mvp150 = {
static const struct rpmh_vreg_hw_data pmic5_pldo530_mvp300 = {
static const struct rpmh_vreg_hw_data pmic5_pldo530_mvp600 = {
static const struct rpmh_vreg_hw_data pmic5_ftsmps530 = {

while in the current patch i dont need to touch any of these above
structures and just add new property and define it whereever
`bypass_supported` is set to true.

i.e just change these 2 bob nodes only.

static const struct rpmh_vreg_hw_data pmic5_bob = {
static const struct rpmh_vreg_hw_data pmic4_bob = {

Please suggest, if we can do this in a better way.

Regards,
Kamal

