Return-Path: <linux-arm-msm+bounces-104741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKRXIvFi72mHAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:21:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5D4734F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39BE63001A6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2482A3C4574;
	Mon, 27 Apr 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejeGQTfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8oMY730"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4212FC00D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296108; cv=none; b=o7zAbinagoknz59I+/d/CiU0R2obqi2zuWpyCUFvEebeiRYnijytsk5SCWu8Yyxmld7TyVBPBSOx341U1zceDvXJeyzJglAwx6MCOriUIMHZ14w7a0NK8xbSADB0TYMApY4zEh/DVVlVIOTPgvFpOO062OuoRXf58cwXxO9ho3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296108; c=relaxed/simple;
	bh=DV+OgBJGIzGBhzClSHZRNeequhNf9StZA07F2RQmgOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u24AQ1cLgrZqzmWESYCxIjhtQFhnse/e/L2CYRXNQqpS9osjvPBQERMcrTBitaUPqfB87TCsGtLeua6LpPbNKnfoCH6mLxx0AqvYxiwa91yGjiblvEYBnio6lx0TFnTy9o+s4IJ+YdbquzH7/FW/6kwV+noWYRtP1hyPwTJyZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejeGQTfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8oMY730; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RB7lLr1238615
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISSsvTNIhqIso/aLy/TLZm+9HzCAZrDmbX+apx8bOMw=; b=ejeGQTfNAJtsDc6z
	Qt9/3Ino+QP7LO6gPNMVbnKRiddE24hUcCqBjJjm4QWus9iihQlPLFQhq/s/iFeG
	i/mcMbQ9HPHUZT09040z5UpaTkFg4i6P0pnsGJjkmDDmFwhJ1qLXViCf8gaNDqyD
	39UHRWIKwNuDzkDyAS8bjSBPXk8eRsYlBkl98AJt9ik8/ohkDCd9RHcnWEgnEfNB
	bnCmietT3HRK2OG9HVvrRs7ei6QA/qslttuBzF2dXJjhCfEXJZ1p9A3bsnWpFyqD
	QOc6Y5y9ErAe+fXtg/jMqgIxxvLEBj2UnRozV8AagBnkioai7OQQMcngL63mSQZ+
	V4li/A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4geg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:21:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56eec094291so648481e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777296105; x=1777900905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISSsvTNIhqIso/aLy/TLZm+9HzCAZrDmbX+apx8bOMw=;
        b=Z8oMY730h31YG/5qfyjkMeCGwx+GI46nm1SgNx/TjzRS//X83mSu/xKiRbItTF4MxX
         aL4HLrlwulCDs+PabE9EL7PkqddtJyB/UzUQLvWF0zQk7ZGPCTEL9hD4nwKZIQsxk8lG
         8Y98B10i18gQ5QxY3+d6veVxAHK0F0qA8nn+nPKKEZ0cPqgxeYwmrJcxExbooX/tid0X
         IRJUsVDfosfudvHeXvtuNj5G8poU69V1FytJFW1/f9CtB/Ex0HsocFxDWaPly71N2DlL
         tDqVBJNKjxlQOckkrSiGWOwF4+tIV6OdFMB/bMPb7P6wr5X2dVPpqIrwLkiBBF7PTFFf
         1AGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777296105; x=1777900905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISSsvTNIhqIso/aLy/TLZm+9HzCAZrDmbX+apx8bOMw=;
        b=d+2+HgYG14Apn1aOXpnMGlln1a/YBgsb910IX8apsCBC0OIL6tfR2r08OoajZLm/cs
         udJ1XAfQ7JfgVa2IoswgZJ/L5vUGR3uK1R5HvM3oPrCEwg5P95MWo0rVAn3YCNcXmqh4
         LNKef5Dm0ZlIS5eJ62hiRSrWCEceaMnHaXVdehN4rDS8H4PtLpLK/pZa7x+PgMEJMckt
         rtcHQktpE/oB1FqhwACUWrW6MDOaY+HmawRfCJl3HTyFSqe2+lbQpekGthr91gHL/T5C
         I2Wcgo0Kf6uvYSuCAxtsI1Y+dBidKJk+sHBEDmo3OLNHH6sveLYRwDsUrdPtI+D5QvPV
         1QxA==
X-Gm-Message-State: AOJu0YxM/DIhVRzpVvuJym+wpDP44TPv2pwQVoZ1VpVgy0H/dH8toIV0
	JbmPqLagso+R/GBvsUtktHcYiJ+FZ46SJNIKNgYbeolylbhkvMGM+YLfzE9QRNjvdvKa5spw5ET
	ilBjryOsQduMko1mK7SzR3lVfFHan/H1rmwCI7DZM9BJ+nE+yi7F01yxxhEz+nYGXtucM
X-Gm-Gg: AeBDieumabVuftkkTH4d/cxaWVigK4qTD+uNXuxYr/RNKOgV6KVOhA7NNxk9NyYrpgs
	z57F2jA9UoABd58O3pkRZBWjSA9MEg3blASfIuCT9R7sCD9mxSNo6ArMm2sx2rxxzES4YZ6hSna
	tmB/aopPiMs2ckFmcVhhPc8649sBGUWu33phm5XOExbjoz7oW4fzIldOh9k2Eux05t6HYOR7jG8
	i/oeJOiWyX5F6/85DaqdJ5ef4zPpSSDgaXvs/76KjQeQdfkVTzpIBL7zibmpt+UMD0p9HVVM4t2
	wfT2tuf6FGjiSBj6+f3HRk3tLqDCRgX50eu3lsoVJRGTazvsnd4HstF3Cc63Nkpi0LKECkFXRqk
	L8uVEFZFwMnoI78yls5KqT7VXwzJSu+s4NEWMj0wIhDDE6hjVtOmMFWqgLUGJDSkSp7MMVbfZHg
	o1z5z0ho+sjy0FrQ==
X-Received: by 2002:a05:6102:21a8:b0:606:2f5:7b49 with SMTP id ada2fe7eead31-616f80647f1mr5891735137.7.1777296105162;
        Mon, 27 Apr 2026 06:21:45 -0700 (PDT)
X-Received: by 2002:a05:6102:21a8:b0:606:2f5:7b49 with SMTP id ada2fe7eead31-616f80647f1mr5891725137.7.1777296104724;
        Mon, 27 Apr 2026 06:21:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121042esm1091078466b.13.2026.04.27.06.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:21:43 -0700 (PDT)
Message-ID: <7004add8-bf19-4100-9e8e-48d5b7ab815e@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:21:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
 <20260427-edp_phy-v5-3-3bb876824475@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-edp_phy-v5-3-3bb876824475@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8wkAtsmHWWsiv8y5zI5kfCZBL5oEQYGs
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69ef62e9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RR4ymGWTN1MQ7N97tYsA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 8wkAtsmHWWsiv8y5zI5kfCZBL5oEQYGs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0MiBTYWx0ZWRfX1QDu1SmLNF4C
 mMJvN9u4hIoJ6z4mCkrNtaSthg9wnA2uxYogjBsRsamRS6zfS7AR246L7ySnslFbgqhBWG4q4Wz
 S7xYi3zl4z1kzYMvDX8PGBOIEyqUghwH0Odn5ByUkN0Y/61kdUfP+ksXrgfRZ8PEWnbsIRi7sck
 Okj+NMG+leQibdtM65zMOY2c8SO3Z7P597EuAEhotO8ZMQ0SBmPmHNr2vQ08vaaImMOeaM4Ivc0
 Dhq18ovUMW81+WtL+7S8KnEuP/Cp7SFvxku0nKfOraKEUm7fo8VfdAZfmFzfZZgW96t0HMSZmBu
 0jW4oiPhr/seh6G51IoDSComoT9s+gLoovA1aCn0gm5pbRvMhf7JcQBnKv9Uw+SDR6mlDQfk5Dz
 AAo+MDYuVgZM0xNupiokbzFnGrs9Va34AbkHP+hLp6ZC+/kN7GzqGs0dEPeQR1aREzhTVUujZf5
 DzLSxQQlYeehAA10aJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270142
X-Rspamd-Queue-Id: 87B5D4734F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104741-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 8:35 AM, Yongxing Mou wrote:
> SC7280 and SC8180X previously shared the same cfg because they did not use
> swing/pre-emphasis tables. Add the corresponding tables for these
> platforms. Since they have different PHY sub-versions, their eDP/DP mode
> tables also differ, so move SC8180X to its own cfg instead of reusing the
> SC7280 one.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

