Return-Path: <linux-arm-msm+bounces-112094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a37AHMbhJ2rh3wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:49:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C85A65E8A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:49:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="K/WrcX8E";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Yong9F7i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112094-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112094-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 186FF30CCF22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8774F3DFC7F;
	Tue,  9 Jun 2026 09:42:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6323D669C
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:42:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998160; cv=none; b=QFlAJOfPmowvam6B/QCFVXK+clDR58MIMyta4amFGHrIOsd7x/CoYboiP8ukTesZ3XGVlesXQgk97d+Bxu9RUGSz2FLXOb8VJck3YHMX0EbaWFGdF7kfLMXq37GvPdl0I3hdwsyHNhVCI6MnIChpWQSkrhK1BSTg3Xm0c1ExJ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998160; c=relaxed/simple;
	bh=pRLtaagejePOW2Fg2YPKRLjIDCmXJrayZ7Q5GXWYh/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfNCpm4zBwGJQ5a8UR8nnm1qIQHvs3EA+pthdpuL6Zhgq25b/B1M+wCe2So3bdEsTwcOcs7I8BQD2u5dn8bYew9AmdOpSNcJS7C6cTah48xBoH/SUutVP5BX3bdJ6vLfw/ORb5mGgZx3gp6hXFU1dSoB2kLzp75Edoyn5e1uh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/WrcX8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yong9F7i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599JqO91784172
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3JNmHHdS4gAWMcgDN6ouymySktpffftWHFLxG6U5y0=; b=K/WrcX8E0ZBjISFp
	zvEvM2wWb6aedQVrpP1VJP7o/C2QZcd1L+J1uvQHY5Skc/GuVZUHIN+ohIPkyLnu
	UBBj8a/TkMuSDa0lnqUSXLsLbeNMxOSOllhLSgaNTIEQ5RaqIhJNSjnQwhjatAzy
	G/0tMUurbiV2rUQx7Mu2fay8naZ0d0GcaWY5He5Wc+UvP19Fhc3L6lxUNkJnA9Bi
	2B+Rv5bog9rDlUuyBzJ3/bXCBrir7s1eK0FonUZG0bSEYv3b0wVzjtReGPRhnBjD
	yyFpLMSKVTfY8WOja+ouWLEvt3PdJRXbrhpp/URUa97LmiCc72kCYOdK5g/RCh9d
	+dveCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wg2sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:42:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178ac43d27so14787061cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998157; x=1781602957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3JNmHHdS4gAWMcgDN6ouymySktpffftWHFLxG6U5y0=;
        b=Yong9F7iRosT89uHwTFi9F0BxkFLr5GSPfEwGhTQr0HMJLcqwr7JNkibrrEPEDip6P
         gwXF2g+B9Or6UKSBomPBFOcD57qBKzDnSoscMtt53fbNMX9XFi/BAqyANvk4vCanRtg5
         iGCKpgV5aG9z0xqgJ0OT76yriXoZSIeHK5LLixCvgrX1+2JhfB0PLzGOBk0RVZbVHSGN
         0smtTIwMDATPjbC/MwE+s2eg/bs7KTcI3U88RhRLleXq5JQQL133RJUJL/Q8jTcf7e/p
         3lQFmOtGSW5Kz7xqBPRJapyj7obHFoJN7YSdtP/wjxtw8dGj0A/LOZgbuKier+tjbgN4
         iuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998157; x=1781602957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3JNmHHdS4gAWMcgDN6ouymySktpffftWHFLxG6U5y0=;
        b=If6TLYEMTgpMyoUOnSO8niovrGD8gc/K9x3D9jvi7LEy1gvx4TrepiFn/hepdA0XIu
         Z2W/EKBJ1APjOKGjmfsj/qyFNmIBjUFDYrd6FHT3SqKEiytgqCDanyi2lgquntGbkKUR
         GnITVk5Ui4KnnSFoAht7NNMTyAYmUXycEifCz4Vdjy/72DDZQkSDLOgcAZln0ACw+3ot
         6ArI33kh+ESHTGjyS3Xu2WHcntbxzeptnkjSKxHH9YIOkbK4t9lj3wWYkWkFTclfqxKj
         +xKv3KSGFM/XjlBANta29wpgB+bBWpQT7LDjHIVlFDpnX5b4+HQOiCE7+YumKCQU/7mr
         YOLQ==
X-Gm-Message-State: AOJu0YxQmY5G0FqTXkEpP/1DK4erWVihGeCEJU8iBlZQkSyu0RJungHT
	26qKyleeRMOlhMovNUgTL1R5ENrFmz/20Yz8ynD+afc/tU8c/1V1sDoEq7aD7w7lam4AMKd7YBM
	nSftwfeWXd6MZHp8rDhJXxmTLxNeuY/tJwV2AWN2Bi9am8GBS01anQOYR4ZCEEhl7F6fA
X-Gm-Gg: Acq92OGbBWMagRx5xvzyUfVtolmUSicwv/EzTet8v7vlJBg2HqYy7J9Zil9/LtHMnwn
	kxKhWBXIIPAdi1OGQ2Msd0KcAn+vwKsknKm5w3SHKpRKxumDIzPEhYdCgCzatG19QdtvkHAv+/U
	8NMe8HhvZ6V65hcO12PnhkqiAbxQvq3AToVjO+mbdNBvkZj8Xy7gJtWIgDS9NNk3iYYPOw5E6aL
	CKDZj1phjL6EvrIHax2x9O7YHHbEAcflCbJqAGCa0j8U2SNbaD5qWTtLLbufHkjb5boTLvv7/6l
	dQVceB5cQtbmVu0DZD1jm5JEiDPPHhR4UY6ztwvkYzhNTUAMy7S8h5R5u3Atzx5a5h4IwwUZkyg
	f9hSHM9A12c+Lh6gbRv4kP2NtS3QpbUeRUjkIghaEQejkdP0yGAL4P3Pk
X-Received: by 2002:ac8:7dcd:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ca4855a0mr16784551cf.8.1780998157565;
        Tue, 09 Jun 2026 02:42:37 -0700 (PDT)
X-Received: by 2002:ac8:7dcd:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ca4855a0mr16784311cf.8.1780998157110;
        Tue, 09 Jun 2026 02:42:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm1022558266b.55.2026.06.09.02.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:42:35 -0700 (PDT)
Message-ID: <d99447c8-f140-4ac1-85e1-a235c37eecde@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:42:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: Add thermal mitigation
 support
To: DhruvinRajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Umang Chheda <quic_uchheda@quicinc.com>
References: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
 <20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4OSBTYWx0ZWRfX4tGGStT/6H35
 qLIufk5QHwXVq3zGrc/iQOWK0f6d0EJI+U2Mmd2rTv3DTbbQT+kXiD6q5DsmCB0JUpRv6IcDnws
 IWs85D2wlf317Re2UX6xf5IB8iZcXsY+JCfoWizAzRxBEBTLBXZPFCBJn2R3C8AhmtwIsoSpzp3
 L7q98xeDEYwiBNC7MFfNcDgqKUwvsFcJ2Qzc/cNX0I8PJ7bc1ZfVUb5vJYYejxl/BlHGL8LXl+S
 HqGe4AplhFjRwJJ/b3lo44R61Cy+R3CaUHAXapho9W6IJtej2y59hE6Vr1c97wl630WaDX/hCR5
 +HwfLW5e8jICGaTjnCZcNZZ5p0DrYFj0bBvuiaiNC8V0TYNebv8MMLMW/o3zBX8Tco1QbZSHj2l
 oR2razlMOiTrE8nFEtLmoQm3cLtZwJ3m1MN8HjXj3MyZVZNuIc4x8hLJAOynilAANTZCJhDrXuL
 DMcsE0QdNGPIenq8ciQ==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a27e00e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=yrFiz102X7FNP_QAQpQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: C0dWTzH3CQ3QPnio3u8LqAo1z5OgLOCu
X-Proofpoint-ORIG-GUID: C0dWTzH3CQ3QPnio3u8LqAo1z5OgLOCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112094-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dhruvin.rajpura@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:drajpura@qti.qualcomm.com,m:quic_subbaram@quicinc.com,m:quic_uchheda@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C85A65E8A8

On 6/9/26 11:16 AM, DhruvinRajpura wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Earlier commit c85c191694cb ("power: supply: remove faulty cooling
> logic") removed the automatic cooling device registration from
> the power supply framework due to inverted cooling logic and
> missing CHARGE_CONTROL_LIMIT_MAX validation across drivers. As
> a result, drivers that need thermal mitigation support must now
> explicitly register their own cooling devices with correct
> semantics.
> 
> The battery charger firmware exposes a fast charge current (FCC)
> limit property that can be used to throttle charging current in
> response to thermal events. Without explicit cooling device
> registration, the thermal framework has no way to reduce charging
> current when the device is under thermal stress, which can lead
> to excessive heat buildup during charging. Register a thermal
> cooling device that maps discrete current levels defined in the
> qcom,thermal-mitigation DT property to cooling states, where
> level 0 represents the hardware maximum current queried from
> firmware and each subsequent level reduces current to the next
> DT-defined value. Track the last applied FCC value so thermal
> limits are preserved across firmware protection domain restart
> (PDR) events. Expose CHARGE_CONTROL_LIMIT and
> CHARGE_CONTROL_LIMIT_MAX as power supply properties to allow
> userspace to observe and control the current throttle level.
> 
> Co-developed-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
> Signed-off-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
> Co-developed-by: Umang Chheda <quic_uchheda@quicinc.com>
> Signed-off-by: Umang Chheda <quic_uchheda@quicinc.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> ---

[...]

> +static int __battery_psy_set_charge_current(struct qcom_battmgr *battmgr,
> +					    u32 fcc_ua)
> +{
> +	int ret;
> +
> +	mutex_lock(&battmgr->lock);
> +	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_SET,
> +					    BATT_CHG_CTRL_LIM, fcc_ua);
> +	mutex_unlock(&battmgr->lock);

I think the entirety of this function, particularly the assignment,
could use this lock

[...]

> +	if (ret < 0) {
> +		dev_err(battmgr->dev, "Unable to read CHG_CTRL_LIMIT_MAX ret :%d\n", ret);

style: "ret: %d"

[...]

> +static int qcom_battmgr_parse_dt(struct qcom_battmgr *battmgr)
> +{
> +	struct device_node *node = battmgr->dev->of_node;
> +	int len, ret;
> +
> +	ret = of_property_count_elems_of_size(node, "qcom,thermal-mitigation", sizeof(u32));
> +	if (ret == -EINVAL)
> +		return 0;               /* property not defined, thermal mitigation disabled */
> +	if (ret <= 0)
> +		return ret;              /* real error, propagate */

Does battmgr really expect the OS to house this information? Can we not
retrieve it from the running firmware?

[...]

> +	/*
> +	 * Element 0 is for normal charging current. Elements from index 1
> +	 * onwards is for thermal mitigation charging currents.
> +	 */

Documentation/ABI/testing/sysfs-class-power:

What:           /sys/class/power_supply/<supply_name>/charge_control_limit
Date:           Oct 2012
Contact:        linux-pm@vger.kernel.org
Description:
                Maximum allowable charging current. Used for charge rate
                throttling for thermal cooling or improving battery health.

                Access: Read, Write

                Valid values: Represented in microamps

My reading of your patch is that you expect a level to be passed, not a
uA value

Konrad

