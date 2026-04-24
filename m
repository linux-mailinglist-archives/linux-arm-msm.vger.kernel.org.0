Return-Path: <linux-arm-msm+bounces-104491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMKdCoKk62nIPgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 19:12:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86501461ACC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 19:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEABE313853C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 16:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715F23E6DCC;
	Fri, 24 Apr 2026 16:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACOTE603";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZKyeToP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805193E1205
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 16:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777049548; cv=none; b=fAdyrO9ALRAtP19VsFPQiwE2TFu32V22hKRw16T4VUI1CuBi2Ny6KcQASQd9YPOgoTttskwVxHli6hly+TyYKxEvaSEsatd1s6Af7Z1hbkrg1BxPowvhErxfmOimK9f2RdmR6lV2qtPMzGHbnHdoCTJtmpiAeAtq3PAZoaixZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777049548; c=relaxed/simple;
	bh=9xSazYawLTJx5H1mtxuPLWvttqXrXwEJAo2WZiAwZh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=og0ufYjxUOhrOpLc4UsWS6NiOykoOSscm1MEzlOL0TApl8IgLxFI16/TORYuo1rL1EyxIdf9+zv8NY0W86+PUpnk0QQDqxc8gPHUY3TVRjvcd+HyUaNvd77ikWo1hRbIRHzB6I8NOTCwj9edFpq+v8iAN9q9LaPrl5MW8SpArdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACOTE603; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZKyeToP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OGn41D400073
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 16:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	It6sYfKSiD01NnfF8Za0t86txMFNyiI2QETDX7JZZdM=; b=ACOTE603jB2BH065
	54l8eUREJQZBzJQnBmC+6qdSvIUlKxWLxmRfSdEczuxGWvsfXJGHRpNVI1p0tOp+
	qOrEtL4OoKtLBmvUCS6DGb9erYeu52RhC3KkxDE9XCNEO/ANoGKOu46hA7tn58zB
	6ud3vhf5KCJueoLkdoDJtC09NPzut3u+MDUiFgcjFIvBc1Co/yeb4Ywe7L/6HTc3
	mpSdnXxRkw/DOxmSw/ckixDTu+aSv0GfyTwpu4+0iw/Xd1R2eEwhnV9vS91+64PS
	0K8dEO7mNo3UtxEs9Em1oRODc26vIdywW/Wj7VJi92DgxP9dMavEHNirfTy1TPFy
	gdZuFA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26n29r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 16:52:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249541063so72513145ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777049544; x=1777654344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=It6sYfKSiD01NnfF8Za0t86txMFNyiI2QETDX7JZZdM=;
        b=eZKyeToP489wxcG+nxXGQtDTY2kW+ltIqI9d12wTB+Fv5tSawtrbXoXhVbXMEP1AUO
         AFArfKr2Kbctrt8CUTlS5tFmUa8nEKjAOsvOnZsL5C+kNpdJh6GtOV9q5F9pgdsxm6Hx
         XVsR2r1UcRZLz3zVnEylxj7XkM63HKMDy2w8LGAO2Zu3s2yH+clHtlB4cFygXsa5s7li
         DxNKfNt+NoEHSUEnEVEKocnsrMJIpRY2npiRIU9lUjSnjP854+PQn9pZDgJQTyT9KWAw
         QGYi02IwmTnbIFDOCY59hfgU/PTSopKzy1QVtCu3oSX80Joj+aOu/+Zt9CNJvoD5XkOE
         Gj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049544; x=1777654344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=It6sYfKSiD01NnfF8Za0t86txMFNyiI2QETDX7JZZdM=;
        b=hrJ+bXwHKh0TaYD7Ls6caWEdYwSpYapxSh/vbA+w1zDOYYMxYrmhVO3GtsWsWhFsns
         5lyYTXsWaSr1UUYauX/cVxYb+3R42hWdUn/qU1GOdwdrJT0jVWMQnuyBKhBPN5V36Lx2
         9dqCyPH0eg6lNIHWD+aC0p4VWb+wZKVlrMHjoIqEbgJfdc3rcwpfl/w1sgMT9l0FraHw
         2Ii4WH1nxV+oV5L/GyfMcQJRc7gBYaalmnU5MuWjVwdiw5VlgNWvSND/SS5ZbhcnKXIC
         ETqtPxHAlKuMFNH7KtUlw2gtTw9+wj+6zzwuu8IPG0OWDYj4CtGSQBb/a+voWYcIfq0r
         8rvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+w3EEaoEMgB1FeBJjl8vlIlE1N89ZZABvg5gXxeSZvw+fdRHP/fA95iIqe+4S5Q57xqqpwGMp4virRx4Fq@vger.kernel.org
X-Gm-Message-State: AOJu0YyzEUyb3grxeP+ETKI4CSxi9Vm3Cr7z7Sv9njahzAoC+/AVE1eg
	SB9n+zG9hL8bP41Tb6iJ4I6MSJ723MOzTJ0gGx2IMs/tgsBI6Lg4F9jYlXFVFjaux/Z7YBuOLi8
	yHbclJm8vlziOWWtzHTC9+h9e/SpH48gPB3QDKUPzJifgbEJ29Kzc/LpqCc6Py6DpDBDJ
X-Gm-Gg: AeBDietxOtdv/xl5Vt8FTNyvTDrT/QQeghpVr1CrkqzEOz6s7LYNbaYhaUb+QiqMwxQ
	+ShGU+1/cpelJ2S5ZKTDibuAcvFvighm9PI79M0z2KlLwUHFif1xBru0x+orkFQjMe0jZTR1Gf1
	kqSUFGFVzsyJ4FyfT2UI/Ga7okbCa6/Cno9pv6N3e7bg8juj7KmEQSGevr3OlMJAobO2/cszI9g
	wjUQ7QVy015aNSnXv08fZnHJEixYi+Msd1ykHtQvW0YlDFB1vaLH5OhK0fGYu/uMHGssklQSqRi
	d70YkEqJ5s58j7XBk4urhcbbS17NgSc4FcIJHu473Ax0K8SnLwU+JBoLvyHtSxHcfX+lrjfvij9
	Vf1dEqeSiSbWGyGucXYyO6v0JObZK4wZ8mTvQHzZlTFVchQAOTzTlb66jMSIYp1p4APc=
X-Received: by 2002:a17:903:384c:b0:2b0:7e4d:f390 with SMTP id d9443c01a7336-2b5f9fb1b9cmr319062095ad.41.1777049544189;
        Fri, 24 Apr 2026 09:52:24 -0700 (PDT)
X-Received: by 2002:a17:903:384c:b0:2b0:7e4d:f390 with SMTP id d9443c01a7336-2b5f9fb1b9cmr319061815ad.41.1777049543591;
        Fri, 24 Apr 2026 09:52:23 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.228.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa30134sm236758165ad.30.2026.04.24.09.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 09:52:23 -0700 (PDT)
Message-ID: <62c0372c-9683-487b-af53-03d15b4916f2@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 22:22:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-2-7de325a29010@oss.qualcomm.com>
 <c38284d9-f7a9-4a0f-a4c7-cafdb1a1f720@sirena.org.uk>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <c38284d9-f7a9-4a0f-a4c7-cafdb1a1f720@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BVuHNh4jnwfZJcz5eF3XcF7P4nwn8g0d
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb9fc9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=DCeGIJpHnZWVbLPzD22jCA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=418Utox6nRxWSOscvWMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: BVuHNh4jnwfZJcz5eF3XcF7P4nwn8g0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE2MyBTYWx0ZWRfX4KLxAgCwqHTg
 3oJ5kaELIawgZYRp5bQpCEUJT3+vn8w9UG7s9f+3dXFs81645ERdujdRK2s5uDr0P3wKMM+K6qc
 mfIcl0wksAL3Yig70em6Y1MeRahVH4FA/aboLkRuzUk4aSYt84l8hKVjNC+sg9THroVGrV9v13T
 zcrCeqiJPS07So17cdbgNKUg0X7IWWidCIkRwHUA0bzVFFN/PeKkKmIFrFjSqxaK6Xg3Uyttrh/
 5LJ3AdxzsK/qB0RavlVcwD3uZbtPiKVaXiwXgEdDcVh2PwYiu3x710h/s17Li1ktEmG7GGuc6rE
 pEK1GFplRja6EWEepaXxnf1PB2hSLiNWALgj/cyKnyCKEW1o3HE2PwMrY/x+rP3O1PMeb+W/zxQ
 zbJ+0XBHM2BGMkfAnocaskFQ3MUCH8AWshiu0d68N5sB0WI+oM+OYMwZizqcEJRnMVowQWq/Ixe
 ktMgYlb5EDGd+zpO+KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240163
X-Rspamd-Queue-Id: 86501461ACC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-104491-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/20/2026 9:59 PM, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 11:42:49AM +0530, Viken Dadhaniya wrote:
>> The runtime PM functions had incomplete error handling that could leave the
>> system in an inconsistent state. If any operation failed midway through
>> suspend or resume, some resources would be left in the wrong state while
>> others were already changed, leading to potential clock/power imbalances.
> 
>> +err_select_default_state:
>> +	pinctrl_pm_select_default_state(dev);
>> +err_enable_icc:
>> +	icc_enable(ctrl->icc_path_cpu_to_qspi);
>> +err_enable_clk:
>> +	clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
> 
> clk_bulk_prepare_enable() is marked __must_check.

I’ll update it in the next patch set.


