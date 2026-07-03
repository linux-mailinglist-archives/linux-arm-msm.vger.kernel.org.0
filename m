Return-Path: <linux-arm-msm+bounces-116287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HKviKz+XR2r+bgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:04:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDB970195C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:04:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LHomkWnd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b24Uwb9h;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116287-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116287-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C594A30CE714
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4A137DEA4;
	Fri,  3 Jul 2026 10:57:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B58380FDF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:57:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076233; cv=none; b=kKGlugSaSKSF4Gl0mSA3TMqEUyfE/THrzfwvAVdD93lFh+1lKgTVFi97RuHtAuETLeP4WDGfGphglhtm9h8tIneFJrz/xJ9BnFXCagHEbgSuk1LMnGKBmjkD8tyBwQIbVo7YsPqhnqYoXp9ljSaodu1xWKkwHFddK1pp72C+he4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076233; c=relaxed/simple;
	bh=s6TRSHFxTTEhyWk89Cxr5Rj/a1UMj3/E/F+SxTbbJGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAwEtN9FGTagvb1YQwVvAbNBv0ihnO0RwnW2PsPGSCFMACQPA2B2UCkZFd2s1bRkwV2rx5H0654bz0d/OBGsiBCBxcdfxbmkW+nGnyNIMmXuP0RyU6lY5tRmV9UkMEkH3jBie1oR2YdkXGnqfMZTyCTrtQcbnAB1iZnpij5Vifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHomkWnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b24Uwb9h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rsCO3123883
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UqsXltvq9Um0I0ku3uOhQoMmt3o0ZYCVgjoozcaiSOo=; b=LHomkWndkPhjuAkR
	5mMxUA2fxolip8NW1HnB8dPf7U10vNPu/JH55oYs8D9iUU5QaAIAw1AQ6wHDGhtH
	tpJ5pculFxjrJHLFhCYl7v9apNl09iqAKUlT6QX6X5TIZlj5h72DQJlLJ47uei+G
	MpUuubAJ3tqhRLXr7ONXGkRK2ENDShylqYdENw1CyrKAe21O9Du9qYL/CYgQqQIX
	NNxAuPNXmlHzAvoQw0WGAVg+wW60j4hXDtav0koPu0604EjJVm6e00iNQiR2RinR
	zowXE9/HncGmktHiC4Vyq0U/4UB9+UQNkw7uKzOMY0dXctQ8MG2RLLfpnoJ/AljI
	8ZahJQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcxwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:57:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2d2dd52eso660851cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783076230; x=1783681030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqsXltvq9Um0I0ku3uOhQoMmt3o0ZYCVgjoozcaiSOo=;
        b=b24Uwb9hg/49xCvPA14yo34NimYqFbnQqdGvF7Ct2ujdKNkinn9KQb3OqXjxhzTE81
         i8KDERsk5EeDEl2e9bKDvAcE8JiKlDfkmOvaVMlTkBmFtoCevCWuUuPRbJ3sd8/B4Sbl
         jfACsFcQNgCu2gtxfMwjWaZt9E5EZsGEIdnWDOPsYHW8FXwE/yqKuA6NwphNssSt9wRK
         yekmFLqnhU1LIjUW8WzpEsd9TewVZY6ec6nD8mP6v8GY/gk7Sfb8pSNv9POTXaVPQRcp
         Xzs2AsJUrogjKpcEKuZoNn+uRh4falF+tL501cXFQ3yk3goH3HeLb73+07+3Kwg6i+ov
         5kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076230; x=1783681030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqsXltvq9Um0I0ku3uOhQoMmt3o0ZYCVgjoozcaiSOo=;
        b=EWH31s1WoNrBMUXneRp9KUkmF5hY57YqlwKqmwQrlNR/Oc9wxHvPIrv9n2g2eLOLT6
         Dq0wjFj7SV96G9A2zlbkmUgsfEKrB/3QkKeaLO8UW/ZNQQ57Xzp8+d1rQ7nq84lJhfRM
         wFQTMHULJ/tX2f/IIghHrl491t/FCyxAZEFW0SxkJV7zAzWGiTvO6Cx1WALwouGy6xIu
         XQpsEOHHklAJkRlAXqQlKe23mmA4J/yOx6Yuj7uxOb5J8R3SWy9yWdb/jfXMbfuMq1Jw
         phLFEf0IAdQG4T/JzeHqiKDtXsu2gO6km3q9S888UK2oJgEIjrtDbxSyQdSkk+tCoOCy
         RArw==
X-Gm-Message-State: AOJu0YwryYMcS1lGqShXiRoZRZpBPcsnKyYiaJ0+4duG687wRkLjKBxe
	m2Ib+4CfgS77XKpgCF1FizmFdBRB1lWizbk71iRsN+qWoRfjv+oToo7CIiHxO0fucSC8nbBVXGV
	BPTBEifxQR4F4yD3qSdRf+9GKzkILv4sol1P7r8TYyO1c+JOLHeuHBIriw3nPViX5MMbx
X-Gm-Gg: AfdE7cnP7KJIVkwraWYeD9xyiCkRlmn4fIVmO5UiUbVJ82rmaGlm84L/K/BRAF7GVdm
	sTA92J601zySm/d2SVfKthIMRnnTEU3Nfb8oLagx8y3eiUzEt0jcGwE/uWCrKSJZ58hy2Bpcvd+
	tQ0vwSCBujoCIsPDyslTrx9Spq6LZa/QofWFyLs8LzTpZs0BHnGaxhJjUAgFVQdQvQZvs+NE+EU
	i4HExym5rkz3ztbtod8la1P7AKh4nLk3bbQbHonwgwWfUTqfW0++5itt5TovgJszoh59hIXTKti
	ctF3PirvWmo0wjjLE6K9U6mAdfWOsh/MZ0q9bjrNweJ9d/6kB3maon/67Euau+Nsabw5w6AvYDV
	wLPFCO8mHcSaWeCK2D16EroJoArEt64mVYNs=
X-Received: by 2002:a05:622a:102:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c26a7a55emr95821821cf.3.1783076230502;
        Fri, 03 Jul 2026 03:57:10 -0700 (PDT)
X-Received: by 2002:a05:622a:102:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c26a7a55emr95821601cf.3.1783076230028;
        Fri, 03 Jul 2026 03:57:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62d1adfsm267905166b.54.2026.07.03.03.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:57:09 -0700 (PDT)
Message-ID: <53ec69fa-c840-41b0-8a53-3197fc5bfaec@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add missing properties to
 usb controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfXxHooaE5Ojp0L
 dVTZcd/xc3A8jAr8s5ucITIqpHx1C4qMYd1qNqi7z/2Wkf8byPjMg31bQ8SUFPAa+PK8a16sq8r
 TOpHaLCETeshWn883dg9OEOUcMIJ7Cw=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a479587 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KQhYNC0tuK_561vA5pkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX7+0y1TA09h5n
 OWFk3M7y8KgvOBJBD1H5rj07GEEZh9V6vczDJCq8zPXyX/XAMPK7trPDl4s+3D1bkmuD/iYLJDO
 lly7pUl2pfGv8zsaSi57qfdsXP1ny7S/XiZO6iGOXw5xzJJKUoUvJ4+7ckDF6d19iTQLrtk1MpN
 Q9qOyn+/rqmm4W4FukUAE7vYybDUtao2SUd1ACZQJOHJCbs6e7HYn2CE4NoE9WzKbDlhGnIoKBw
 KjXIGaGzsKdvmVcpjbAUgIf0WZQ09eW563uEu+rlkYFfnqAuH+2oyG0p2g+w1Uw4Hc2oZLpWgcF
 OCZNyx0vQFImlIcIt+O9p+v23dwxSwF1dz4hyMBpsQ4m7GZ1PS60izUoKvKuYZ0QLMJkFsuzClJ
 PACpiNU4LYdIIx++VjNMoXKUfpX9Jmegm5ocJ0jFyAc7Um3gBctnw45EPTMKk4LocfG/hbDUjSr
 VAYOVmx6Xxr2kc9qUnw==
X-Proofpoint-ORIG-GUID: hZjUPHkIl2tqwhR0WjXsSvM9THPRNiJ5
X-Proofpoint-GUID: hZjUPHkIl2tqwhR0WjXsSvM9THPRNiJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116287-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CDB970195C

On 7/2/26 8:44 PM, Krishna Kurapati wrote:
> USB controller on Kaanapali SoC is capable of switching role betwen device
> and host and also is a wakeup capable device. Add usb-role-switch and
> wakeup-source properties to the controller node accordingly.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

