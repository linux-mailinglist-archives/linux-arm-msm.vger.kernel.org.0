Return-Path: <linux-arm-msm+bounces-105085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNcgBbgn8WmAeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 23:33:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700A48C546
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 23:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57AE6301F9A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 21:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA8C31E824;
	Tue, 28 Apr 2026 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvPsDiU/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu/k6BLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D415722CBE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412020; cv=none; b=RMS4a6sT01x1iCuEIHC3R8R47lU/PEcLr3MqIoV0HSkvxWYcNF/WCcceYx8sCIyXi6klIgQ9WwqriqlWNQIxHOKNmaUAy7K/Tut4+mGT2/lvZBLCBqaXMlPtPP5o3q+AE+OF+aqSocE76JV4O1+p7JijWMOOGPKpUpk70qv+1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412020; c=relaxed/simple;
	bh=0NYIEA00Qmgpw8tJRz4f5JZie9BffzOinrPloczcYTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBGUshh2Xx+jFrvODdQ57xbPVfEqPlwLaN/eQdx4vaMwlmFXlIa/3P6Qb975kJ1OkRbOfBraz+SYeVuZuppPuK9yf9uIq4SdDA8PbBQzCRrR2wlWQechIFPBDnP1TawDCUgL2pAaOHu/aRCB8KhKOH52/XkiZN8aRH1OBHGgT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvPsDiU/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu/k6BLP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SH0nYd831494
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ge1sLARKzND96ab6rHpgJZw+
	+DlOfYLsQIQUcU4alMs=; b=OvPsDiU/5CYpP7jyHOlmr3iRE/iyYarf7zSoo+EM
	KaFk8GqpAOGyQl20BG5RbKMA74BVYFSF2S0Sn0TfyzB5DuIYJzTMGYb68JkeIA7K
	WOXOtHNUdFeJEXL5y8vfs0YjmIveuh+7pbu2eJ9DZrS0dFpXnsGgqpl80rUFYNk9
	CFCnQk7W/EGPGEsP2N6PYMtEi16LnjfN6ly7yhH0sUJig6UzKKEk4MmyvV6AUu9C
	RuZau8yXN7UvYeChowgZNneX9K5N8URAjwaLLFkJG1NINJx9q+0Es+RZTsNmbAkU
	yOCn4+jVigMf2MwE0mk+ahwHFvwjAJsRtRbPDXRiy/D2uw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wq8w79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:33:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so124524275ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777412017; x=1778016817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge1sLARKzND96ab6rHpgJZw++DlOfYLsQIQUcU4alMs=;
        b=Gu/k6BLP5qoPCWEWzIkF+9NZsxjTUOqDHLGq/HeULIqR9uwt3VAZeFjYku7xgnHLzZ
         9NCEgRJ8kVPkn6CUr/fdBJJeAaq3sLCS7IeAs8xEeZQDdciC5WHNwG1ZF/Fjp2xqnOfo
         qUL2RdlkJbGRlUvxp71WNNZUsc+vN9HNY++OwTm5E/SY3DhHWeVpdPy+SykrGD9Fku+9
         idmUl1iRhpxcwRZzSjxu0mzW/UgO+NjQt96WOwnlQR4RgMIAa+ifjBKvc7ne68K0TZvk
         MGgW2msOLSh7XFtV3TFE7tYmzZCF7wXNPJuknqMoXbcYfTpvAJ/hh6NXF4fot8FpM/8L
         b4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412017; x=1778016817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ge1sLARKzND96ab6rHpgJZw++DlOfYLsQIQUcU4alMs=;
        b=DQZsLahC4j1AZrDtxr50TFJIy+sqkmOqy9L+6y9sK4fgGwiNeDcngUUMFVvnDKVdUz
         FsXbQ9d7x3ZkidXNCfp2Qic3Rb77V5msyHFAIj3zCbfHk85g5UO98s9BbO/FG8Da6uaQ
         Yxb2Z8zhGnS7SmgzkKcanKM6jr3Dv1WlELMRMdaDz1aw7oi35utd4k1YFg4E6jK1WZWW
         qNKahjzu4wWx27QbwfRhvVv4msYJZ6ZgkpgJGiJ3cxXm+eRomQMdRays7HzyHw5thGLq
         gWUypRuTik2wRRFcTLGyEqJmVn3LmGDDKpcyYaoL++U8P9VrXHIwLqFImmUH5B2dfnoq
         ydaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/n8OpGaKP2VrNPw+wa6JJO4LUwuZse5Xg0NWVV1DO/JhbcmnVyueWCpvzYfJj/3UR++4DnLHChjUEtH9Q3@vger.kernel.org
X-Gm-Message-State: AOJu0YwYHvuHsunYufZSthxIrwv6IyLc2LkimERfW/BBrWXf2Dlh83eW
	CMEOHOgPDNF4K8bTbKsbdZ1P5ecMHPb79J94P+9jNdSWC69hmhCH3toX8qQu0qIV8xIf6f48Fc+
	+nNsgOoX+WS+LArnpyiG0lPzHCT2N+HPBLQa7KQxvvj/vyeZ8aoewrvw0LgRTSHlI/UUZDrv8Aq
	LZ
X-Gm-Gg: AeBDieso2U795Vonb4eh42HZaPxL2gcNazZnL8EwV78nXIL/9MoMA/cmEmU5YCsomVS
	kjEsRfZcRvmBGvPqP5H1TydXa7IvYEvW2ifybZ7Lck1sTcy+UDUDp9IAW1ZS9Yna6KscCN8osYF
	7Zl0xr6mJgvt+lxqymNRxYh1aTKSvHMlFGeZ33k4oS4TDBt6qlbUQ6oah19JsBgmPfPuxbU0Oaf
	LmT0skrgXnFFuoFyXtVfZ+nIdhOHvsRXLrHv4weq/HD+SDNjYlhJPbMJB84wOwhbXbojwq7XkXm
	KC0bgQEgn+t4qOohkT11/v+ktiBFjwxNpadGdOfzAnBNCBK+Y4nKxm1uUtBYQGVXTnXvJkKn/6h
	G878ztm8FZmL+HkC5/PFQ/bNiEEL5J5veGyyp1ZbO0KYiaJwfADoPJKWp5LlrNA==
X-Received: by 2002:a17:903:1251:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2b97c41599cmr46114945ad.14.1777412017168;
        Tue, 28 Apr 2026 14:33:37 -0700 (PDT)
X-Received: by 2002:a17:903:1251:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2b97c41599cmr46114575ad.14.1777412016643;
        Tue, 28 Apr 2026 14:33:36 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98878a9b0sm1780035ad.23.2026.04.28.14.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 14:33:36 -0700 (PDT)
Date: Wed, 29 Apr 2026 03:03:31 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <20260428213331.mwnybqlnognnrpfw@hu-kamalw-hyd.qualcomm.com>
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
 <20260420-read-rpmh-v3-v4-3-70c152e6c958@oss.qualcomm.com>
 <66f59c2f-f759-44b4-9639-d8845581ae9b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66f59c2f-f759-44b4-9639-d8845581ae9b@sirena.org.uk>
X-Proofpoint-GUID: j3OC5idvYmxYbchMMRLp4PVfz-B__i9m
X-Proofpoint-ORIG-GUID: j3OC5idvYmxYbchMMRLp4PVfz-B__i9m
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f127b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=LI2a0ohsDblj__XFKA0A:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDIxMSBTYWx0ZWRfX4qlJv+mA2ooD
 yjTVvAmTirSLYM4Vu16zIMhcRMbGVpRnZGBk3DNRZmoi36JrkYMzWAEEoNqfL00rsBN8jUBXPn4
 FJXhSyioC7krfm6Wj23u+PV6TF7ixTPDDIJdZOoJA3IJQQyJuYTqKJSkcdO3jCcXuSuCf3ajhM1
 ZF8Bdcc27J4Lycd59nvvtv12z2V1sFYPLgKI5RLFpljGQVq47qVGGjYwzEUMJlR7DXaQ93c5W7G
 2aLLNBau7m6H6ds0REgjbkb/hSsygK4iT9qg3g1idjZC1Tha23l4O9Qxzv6/krCfWBKHrik2wku
 xUV4FYIVwK8e8zyFHQWe+JxblZn3qJlsAR26wdwepAy3jOjfboel9x7liju2Y2gk388gCGXvlAD
 CDCRuuJkZbphMO0HpCqW/6QHowilVVHXp9HgF58sEwIzIaHMOWzRmXf2zlAvgUeMT0E+prtbXdh
 pXIVip5K7d96ZeZZ2cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280211
X-Rspamd-Queue-Id: 5700A48C546
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-105085-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,hu-kamalw-hyd.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 21, 2026 at 10:16:48PM +0100, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 09:13:40PM +0530, Kamal Wadhwa wrote:
> > Currently, during regulator registration, regulator framework sends an
> > unnecessary `min-microvolts` request for the rpmh-regulator device. This
> > happens because in current design, we do not have a way to readback the
> > voltage settings that was set during the bootloader stage.
> 
> > +static int _rpmh_regulator_vrm_get_voltage(struct regulator_dev *rdev, int *uV)
> > +{
> > +	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> > +	struct tcs_cmd cmd = {
> > +		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_VOLTAGE,
> > +	};
> > +	int min_uV = rdev->constraints->min_uV;
> > +	int max_uV = rdev->constraints->max_uV;
> > +	int ret, _uV = 0;
> > +
> > +	ret = rpmh_regulator_read_data(vreg, &cmd);
> > +	if (!ret)
> > +		_uV = (cmd.data & RPMH_REGULATOR_VOLTAGE_MASK) * 1000;
> > +	else
> > +		dev_err(vreg->dev, "failed to read VOLTAGE ret = %d\n", ret);
> > +
> > +	if (!_uV || (_uV >= min_uV && _uV <= max_uV))
> > +		*uV = _uV;
> > +	else
> > +		dev_err(vreg->dev, "read voltage %d is out-of-range[%d:%d]\n",
> > +						_uV, min_uV, max_uV);
> > +
> > +	return ret;
> > +}
> 
> Why are we constraining the reported voltage?  The hardware may have a
> value that's outside of our constraints, we should report that if it's
> the case.

This will help with backward compatibility.

To elaborate, till now for all chipsets using RPMH regulator driver, the boot
time voltage setting would always be overwritten by `min-microvolts` by the
framework. However, i found during the development of this patch that on some
chipsets like SM8550, SM8660 etc for one or two rails there exists some
misalignments between the bootloader voltage setting and the APPS side min/max
voltage limits(subset of RPMH firmware min/max) where the voltage value is
set lower or higher from the bootloader side compared to the DT min/max, which
caused the regulator registeration failure and all the sibling regulators under
the same pmic will also fail to register, even though issue was with only one
regulator.

Ideally this should be fixed from the bootloader or RPMH firmware side, but
since that may not be possible to do retrospectively for older chipsets using
older bootloader/RPMH firmware images, i thought to add this as an error print
then to cause a probe failure.

Note - After printing the error, the code will flow the same way as it would
have if the read capabilty was not there i.e regulator framework would proceed
to use `min-microvolts` as initial setting. So for the older targets this
doesnt break anything while making sure to report this as an error print so it
can be caught and fixed for newer chipsets.

