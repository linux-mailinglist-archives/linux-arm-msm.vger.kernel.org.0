Return-Path: <linux-arm-msm+bounces-104270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH6kJHXm6WnxmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:29:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D027C44F8E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 994703007E20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAB33E3DA8;
	Thu, 23 Apr 2026 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKdE+Wy/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yy6E+bcf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84BE3E4C6B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936526; cv=none; b=Ch8cWus8rpn/RBPLvmhsn9sJju5rrYKUrQDgf8a2HWFj0u+DFlc3JqUSzAmq7nK5uMiyNrZBLTnYmItVS/+1r5ZVFcAN4LRe0Yhvsu1jI7UuTdv5ouoHW2KZeHZ7eMdAJLSt0+vBZJZwAIbTMnSrNA1ThRtt/4hfiPMStDoYXLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936526; c=relaxed/simple;
	bh=7sGzYkLtvpkeilVo/z8k9tG4LnfR9klT+cmGTKBJaSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnlWQEGlfxtCS3hjEidPjszU4BfW/6LmJImq/BOQlW8d7Z87XaPE0QR/kVBQipSLNweVTWnf/27UG1lQnckrE+fkoERIB1g6t8Vs5RnSVhN7QYAHWV7WLBkNcBFwGxaAPU7nC7l2ajHfMmWb1QLJXJ0a+DvuPVG5FCqDmuP3N1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKdE+Wy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yy6E+bcf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uM5J987903
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iM1YNSL2ppjwCAd9GR0MbNKa
	rWPyuSQxfHdKiTGzMHQ=; b=JKdE+Wy/kKKo1xODLbcKw1fEgIG4rwfYhThtJcPD
	MDBG4K0pC+u+KVMUhcSWUBscGNIdocHgcTQ9XByFOJDZo/nlsdGY5fRlFXi73+MD
	94LWr+bOBtcLe8BWH7TS7WP4qyViN3hxY/B/uA4s5ovfmsWJXV2unEz9gCyiJsNn
	3mtLYzJMU+OnSBojjNybtKJ5OEwfPez5vjB3ypH42yJ8beInuBEfmBTJkHBqbZkd
	MAzrCkB53FabEOYQqO6JLvw0ySNj55pcVJt6W1551VDHAcSv9A1wS/VH+ZTLc4Jq
	vQOiQ1ig24ILwqOV7DbOoo0/v+HuqrGpSXYgl3V/Zzhy3g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q384t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:28:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7982224a54so5414729a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776936522; x=1777541322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iM1YNSL2ppjwCAd9GR0MbNKarWPyuSQxfHdKiTGzMHQ=;
        b=Yy6E+bcfBVzu9mBKpF4zUHOf80cr+EgWZ+zICDl+jN9dxqVgzvg8ybU5St4XjZVZA3
         UUmqRmOAVnWX0sgEAtVo51cJ5yFPvJv+yCv10+DVlVmO3UxLiR5SVdsXKwytGi2l7wcB
         lQH36vdBjHz30vq7I2YTISU8r4JocRfKz0idZHGGQDzRYdinTyypP9omgasQLu3gx2ID
         Uxs4oiQPGK/jyby2RSRrSENhpv7PSME4lA6XOoHpMpv07DwniPmOCYrV+VqT0xbQHH/P
         gE+Q8q6xUaS0nuG/709C4eR940cmrdlKMiYc+xQkaimHZg+PJRSwv5TE8hBJwMNDSdNE
         yB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936522; x=1777541322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iM1YNSL2ppjwCAd9GR0MbNKarWPyuSQxfHdKiTGzMHQ=;
        b=JvO9DbQqlfI/D25xkMWfsFK58HMwaDAQjZl5LDBVJEfuwGjAMagxEZDQFu9V7Avc0O
         hrCTpu5/UEcKqr42/CVEqvlZdfMnfWgEMpQ7orFn8MMHPSQtgIjnPVoUIkmsGJiFaJsz
         CnrORosBQppiPaPF+A+wDfFVRxkQWAju0ZgB8deZ68p3i4ovX3YAhDZgDKex7jEe2xe0
         QOzmgUL47s3B75iohMsczi8t8YwSkkozs8aa0gWVOpKJB+xD+ow+i5m47AAxc5VRxuPx
         tpWMGDUwVwQtxQBY2lD52fCOS6ksasTASMP5iYtsYsb7hXdflzwBxaR6Hi+XSdws5UFK
         LDwA==
X-Forwarded-Encrypted: i=1; AFNElJ9QGWAe06YE4gO5cYOWPEZvEoSCoJ612WngTev+DzGotJTvodNo7DGYRnPQ7TAjrnpKlU6BsxyO6ccFcv2r@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8WPxUub0EzuxjQ4ZANsMA4HdZ4DwxTmQ0u3rvwMsDypPAV2ku
	dpSOXLfOeGhXE5bO1WoGa6Tz8avvnrYxzrIbzVPUdtltc1y8MGJh/UOHfDJn67zJyrI31yyLM5P
	UypXhMU61bgW1S0PhG/sodPgz58Xk5M2Kq/Xb+kXeGCr1GMBgafoxFDAVAwn23AtCLrKW
X-Gm-Gg: AeBDievNOF56hURbI5AF++GLu0xUykEkpVw4iqo0SSBFn931G5yunsZUeMSxKVlh6dJ
	cA5KSao8Aq7VYtTLM9TvNGE7Z3zEuBgk/fe2BX1lbaTX7G63J/ltfcWtwGQ0tH+fDfzaYBX2pry
	1S0I2kOwo2seqWbeWGps0emAabmGEbgZe19pqdTs3/vR8j+20PDV+Sn89QWYNd7cirKjVlzffHI
	rXbstf4s1qaXawMjX1koMCZp/Y7XrzoY0lfmNoGsu864IvLuILgYSl89LssweGoziQl3+UIdxpp
	RMd+X1En2ZBLghHTiPyXLy9hUTSpY4VkejcA/MqreaPD9wAowwumDqvG5W83Wy5N26ofh2QVjo2
	8AFcwx70oij7PBXXJYmrR/mAqyS57OnGDghncecFsXVcckxO7Q6F15B2Ei4NCIw==
X-Received: by 2002:a05:6a21:9995:b0:398:ba99:bc87 with SMTP id adf61e73a8af0-3a08d690ef9mr31990396637.3.1776936522501;
        Thu, 23 Apr 2026 02:28:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:9995:b0:398:ba99:bc87 with SMTP id adf61e73a8af0-3a08d690ef9mr31990366637.3.1776936521951;
        Thu, 23 Apr 2026 02:28:41 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f920e1sm14910073a12.2.2026.04.23.02.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 02:28:41 -0700 (PDT)
Date: Thu, 23 Apr 2026 14:58:36 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <20260423092836.zz6fyso3yqtevod2@hu-kamalw-hyd.qualcomm.com>
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
 <20260420-read-rpmh-v3-v4-3-70c152e6c958@oss.qualcomm.com>
 <e2095ff8-5d90-4b09-ab09-287822f844d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2095ff8-5d90-4b09-ab09-287822f844d1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9e64b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hjNyUS9LjWa9GQz47YsA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: KRUHNA8rvz39atTwLe-X5uhX6ZUknjPs
X-Proofpoint-ORIG-GUID: KRUHNA8rvz39atTwLe-X5uhX6ZUknjPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MSBTYWx0ZWRfX82nhtP87xNuY
 dYeFgOC0ZiMsqDLLxN84aTqLUALAJNlbYWOhAEqMlnrNihYwt1tIyUZCDzwoAy9DcCTg9nTgFx5
 0iQ/KpCjcyIyaKRDFy4zKiMJqgKt2icmRElVAG4AB6Rp8b2OUQgmgBDDD2CbcE1TKGMHUvQ3iN0
 fyk29wHCYFrc2lHc4uwCGRi7I56GaJ6U5z8GXtE4B4KmPKiWsbhm+H5WPQ65fUY9VBE3orvSW5B
 vT2TTrCSl+ZNBIoufSsEF8HCWNbByb8l8gP6i8fhY1IOsqYrIoJiwIjt4Oo5Sp2iirdbYOfgsZe
 iyM/YJW1x2yZO+AmV3XwcQsU/c8IW+jyhxOeswgjFOqPMkjIiC7YoyqcBqpGLByV3/hLob39/wi
 8Pg+9/VSABDPP2kpcAI2EIGpZRFA95i4RsTqLklJ1426+MX03vPd1veOBrsPNnvQkb98UigjJbS
 8GSPEda9Zx8BkeQquGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104270-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D027C44F8E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 12:54:33PM +0200, Konrad Dybcio wrote:
> On 4/20/26 5:43 PM, Kamal Wadhwa wrote:
> > Currently, during regulator registration, regulator framework sends an
> > unnecessary `min-microvolts` request for the rpmh-regulator device. This
> > happens because in current design, we do not have a way to readback the
> > voltage settings that was set during the bootloader stage.
> > 
> > Fix this by using the rpmh_read() API to read the regulator voltage
> > settings done during boot and make it available to regulator framework
> > from the very first read after the bootup.
> > 
> > Also use this API to read the status/mode/bypass settings as well. This
> > will provide the regulator framework a sense of the initial settings
> > done by bootloader and thus preventing any redundents writes for any
> > setting post bootup incase the same setting was already applied during
> > bootup.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > ---
> >  drivers/regulator/qcom-rpmh-regulator.c | 179 ++++++++++++++++++++++++++++++++
> >  1 file changed, 179 insertions(+)
> > 
> > diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> > index 85fbf10f74bb3393071bc65681356312f27b7527..1add15d73cac67ad8c0b45aaad6fb2ae9b388180 100644
> > --- a/drivers/regulator/qcom-rpmh-regulator.c
> > +++ b/drivers/regulator/qcom-rpmh-regulator.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/regulator/driver.h>
> >  #include <linux/regulator/machine.h>
> >  #include <linux/regulator/of_regulator.h>
> > +#include <linux/bits.h>
> 
> Please sort the includes
> 
> [...]

Sorry, will fix this in next version.

> 
> > +/**
> > + * rpmh_regulator_read_data() - read data from RPMh
> > + * @vreg:		Pointer to the RPMh regulator
> > + * @cmd:		Pointer to the RPMh command struct to readback data
> > + *
> > + * Return: 0 on success, or a negative error number on failure
> > + */
> > +static int rpmh_regulator_read_data(struct rpmh_vreg *vreg, struct tcs_cmd *cmd)
> > +{
> > +	return rpmh_read(vreg->dev, cmd);
> > +}
> 
> Since this is a wrapper of a oneliner, perhaps let's just
> ctrl-x + ctrl-v it into the usage
> 
> [...]

Sure, will fix this in next version.

> 
> > +static int rpmh_regulator_determine_initial_status(struct rpmh_vreg *vreg)
> > +{
> > +	struct tcs_cmd cmd = {
> > +		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
> > +	};
> > +	int ret, pmic_mode, mode;
> > +	int sts = 0;
> 
> Drop the initialization, it's always initialized before usage
> 
> [...]

Will fix this in next version.

>
> > +	/*
> > +	 * NOTE: Since BOB4 BYPASS_MODE value = 0 we cannot confirm if that BOB
> > +	 * regulator has been sent into bypass mode by bootloader or if bootloader
> > +	 * just has not requested for any mode voting. Due this limitation, we
> > +	 * must check if the read pmic_mode value is non-zero before comparing it
> > +	 * to bypass mode value. This also is needed to avoid setting BYPASS status
> > +	 * for LDOs which dont support bypass mode, and have the pmic_bypass_mode
> > +	 * uninitialized value as zero in the vreg hw data. For such cases assume
> > +	 * lowest mode/status, if pmic_mode is zero, to allow for mode voting.
> > +	 */
> > +	if (!pmic_mode) {
> > +		for (mode = REGULATOR_MODE_STANDBY; mode > REGULATOR_MODE_INVALID; mode >>= 1) {
> > +			if (vreg->hw_data->pmic_mode_map[mode] >= 0) {
> > +				vreg->mode = mode;
> > +				break;
> > +			}
> > +		}
> > +
> > +		vreg->status = regulator_mode_to_status(vreg->mode);
> > +		return 0;
> 
> nit: since you did so above, please keep a \n above the return statements
> 
will fix it in next version.

Regards,
Kamal

