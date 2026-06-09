Return-Path: <linux-arm-msm+bounces-112206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6WmuDociKGpB+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:26:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF56661006
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:26:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="DK ksWpR";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d8GCPbeg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112206-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112206-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 419D730330C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A44734104B;
	Tue,  9 Jun 2026 14:25:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45D634041F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:25:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015151; cv=pass; b=EgNlp5/i31gGNXGXNcCFXbBQdkUZuDk/fFKq5UIMn4aFWehuzOberXL7tEf0/kTaq5PVFj8Z0XNkVymIV1m+f72lgrbyBdrY2V4Il8QHF6buI5BHGMWJO1AbO5BKBsJLHhCrirshDEO60p+uTzgOhjCgiGRERUca6bKq/zlI1E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015151; c=relaxed/simple;
	bh=9Pjs+SStqsKkhAjl8UO9IuhoDtbEDQda3Ro+i7tDlA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbkVCxu/dHMroK8t3Eb+F9ssPYlCPkdI9Z/PuXdyY2RotDxMwYb/w8WnItEZ03ruf0rSz4GKbLcfuBH1K5YNR8PFZ5HHBkDMzSqfDYbKbtLF/Ouqs/0zKWPPvzawAnosg3cXaiYIc7/oW/BEfBlS5s2ReOP+oJSWPL2iKWEFxx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKksWpRE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8GCPbeg; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClMhA2251656
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 14:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=71usq3gq9cQd20fa0B4ebJpRi6XgL/ygSODcBJ05MzM=; b=DK
	ksWpRER/65TvGrHF3rlGHwzKvIuDSSLx/mG597yof91G1+dfUrTixwDzyoqgWd9M
	9bbNN4D+erDTUKzkbyfASWo0uCm+9aiLucefczklDjcE+FQoq3jcSq1XEl2IdrKH
	ye3De7hcd3xWmLgsA7eRvIj2nbHrVzfKfk8hjN2d0OHmBfUT8j6CL0CAynl4ysSz
	hqM9oM1xUBT2YuclYOPvk25OuNEtJJiudbV4HX46vWpicmL5Q+P0X13FfT6gFfK0
	HojplJ8YHo5CHe7Ju6EWstsB8HRmqtSOirqf5wGoZoEbBsgQ/s0JAE9of5qhHP9P
	MNGdpONz0JLUkBSQvXtQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqghsdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 14:25:47 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e60737a964so10805861a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781015147; cv=none;
        d=google.com; s=arc-20240605;
        b=WXigUgLGOauP8YWU5021RTym3LUak11rRuKGO7/fGhwobE6m5SC4pRAAg4Qwz0Zbzu
         elhk/n/9ZkhFTZSWRGzmWKjOGR7o5hA0CWw7DCOfwLJcGLu1rZfA4192fKf92LZm5/e+
         BGqaznUOJwKvSRhHZntg3HR+Vxd8sxGylmLhXJ9SVSC6/6RmyYaLzgxzYztEkPZO7m80
         rhOic22W3APMEj+sYZ0XRSH5HNbkz6vun+m6YUwP2xWbTczSZQK9v1KlRk7MBQyEEdGd
         qgXoS+ag+/nCKpJlOkiKta+nWETXboMEt3U9vBXqWg8DL1q8XYz0xnZmOY97f33Q8pHr
         6f4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=71usq3gq9cQd20fa0B4ebJpRi6XgL/ygSODcBJ05MzM=;
        fh=5DPojKOLiXhaMOjlrDhel5AQCQvtfTNGxyhHAmzcXAM=;
        b=fCzeNor7B8fkQvdDASyZ5Ll5ubbM6etZ9x63x01RrDotDyVYqpPMe4mDNnXlp1RCAd
         0lejLDHGhT7rSbH97Sp30T5L5yuGiuu4guDxnwf2Yqs9F5a5RCqyRWNxy0YsHHSNXNi8
         Qoe7f5vj27w2GWNTy9x/dxKW3RjB1WG21ZvK8Z+I7pMfPgVPV+2/3vvVsJkpTWJkPVSB
         wrcqhgJivjSTwcvfJDFZPBYoahtt/Jz5b3vAsIcXYE4J+Ax3YMcUe6qHARXVPY6PqggM
         iKJMyw9JYcSILpVWEcBKCg9tTccdFBd31oeqDwd5kMTuwmTLmO/Yxkpm+ea4zfj803FT
         UvoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781015147; x=1781619947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=71usq3gq9cQd20fa0B4ebJpRi6XgL/ygSODcBJ05MzM=;
        b=d8GCPbegM6jSBTqdNk/fZlpKtqT3Vk4tGXs/bBrFFgNQjIoOppPP7/pOIsRghoPuaj
         DHBLEvKEh4Bq410DvyZyEjSvZZkkktr62Nl7JHcptjn1vaYiOuroXVqIiI/ASwKqp/b7
         nSH9Jwr8wB0EhGu0I3ffJDVrLYAI8Hfm9JpTHIBZXt8Sn/OzWExhSu3K8w2aRyJrv9yr
         z79DzazaNilqkQGdacYNJTsKgAMNWpfNLQs85OwnvcE+N6fPm0qKaGn1fvdOMMwN6BwS
         mBz3gK28JWQD2B3MCzWeFeFkoo3q5RBURu8mGhZ2I6/dxpsPiWMsxNn8czQlAh50GR1G
         xXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015147; x=1781619947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71usq3gq9cQd20fa0B4ebJpRi6XgL/ygSODcBJ05MzM=;
        b=g5IyLUzIi9+rhHqwJOTKWKE0ItVjXVmuGTshPap4ZGbdjr+Mp3/Org9hG6gGT2iJ5A
         BT5liK1OPyNA2dC1d2/kEzpl/4VGzYbzoZrPY42r+4haXweStKSJ2VT9SWs7dZtGt6wS
         pELzkB+jzjs9fNKdjbhMVizSCB+Zw1DOqWvARfO6Y2YfGFzoy1p+OmilRMIZnbiH1qIs
         VO/mkCqYp4DQ5y0Ng1VFfSMn0Ytv0OUKQDeHXxRhDiLzINv7zomy4ZmKTkiNrvgsuqAJ
         1JmWc90v8Es5ntlCnCV+URF1VRONb11uducnkRbvO+rEf8oh9dnxVW7Wc/xzlnfSvPs6
         x0aA==
X-Forwarded-Encrypted: i=1; AFNElJ+XRqqXa38gvRlEPsBrdGsekEnajOtiqTnQY2BF9j9jgNH470doTpSZKs2l04yMOK4YembzmT5uF/st2NA8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv2EibemNpFlOjWF2rzOwePU7xByVH2QjLlcqxP389MoKualJx
	sSFfU4s7zEeqqgTMEwHVIBOt6X0Qw6oQW9l0+ovI48mKs+TZmr7/Hwkgql4giEpBZZFujGtRvmx
	NSpZGSMSYCRKp1t9eMkevXSv5dHLMOU3Q9L570Vw7BjV4lDd9geu9287eS4N8Z1twJqbnork9Br
	d/QIr0q95s8xu4cL8VKAXBpPBK3XWdOQaE/uY8ZoabCZQfJtmi4IA=
X-Gm-Gg: Acq92OHu+OM2klOclSIQzdoRlKn4fJS4rC5Ub4WssEVrfF4fChEHTalMc67JPLNdVHW
	f/dDgYGsZcuzvYZMyR54WXsNF2U0rCtgdx0MfsZ57WndXxohuCEM4801V0SL9xWm3q2d1gJTL/5
	5l4lGmWHCEhtGK5YZ4Q4sjgLt4FC/XRwY7gZn0QcHlYeZkG2e2M/jfaD0gU0BmSDAuULbTHv/7P
	s0XYJNNtfLKgYQi4oEXm+sH0/s2YbYkQhWq11uWot0BoZ4Z
X-Received: by 2002:a05:6830:4995:b0:7dc:c338:d23d with SMTP id 46e09a7af769-7e70c9f3c8bmr14276665a34.14.1781015147072;
        Tue, 09 Jun 2026 07:25:47 -0700 (PDT)
X-Received: by 2002:a05:6830:4995:b0:7dc:c338:d23d with SMTP id
 46e09a7af769-7e70c9f3c8bmr14276638a34.14.1781015146571; Tue, 09 Jun 2026
 07:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-5-2caa04f7287c@oss.qualcomm.com>
 <CACSVV01dbQcjE+nTic+9R4VfCtNGvpwODH8BMZi8B7LFtcCCfQ@mail.gmail.com>
 <49b8530f-24d3-4201-b22c-0f8eaea9f4e0@oss.qualcomm.com> <CACSVV00vFNZDCN24wSdffZFRWpijb53qbX_-3b09ny4noa7-Mw@mail.gmail.com>
 <d153235f-ffec-4fee-87b2-6008f26d7014@oss.qualcomm.com>
In-Reply-To: <d153235f-ffec-4fee-87b2-6008f26d7014@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 07:25:35 -0700
X-Gm-Features: AVVi8CfIb0biAtmV6jQ1d_iFduyokQv33M85_Lef8QpAnVhMcGBgRaq9DvmuxOo
Message-ID: <CACSVV02_Yh21Ld5NX6Z6iaG0sfTGseOD5S9X_avSC=7RAfNt6w@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm/a6xx: Fix IRQ storm during msm_recovery test
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzNyBTYWx0ZWRfX+fPh1ulkr8qQ
 oMFVc3P66Tm8XCo1w8Vzsu7eabZ8HxbSGtPb5diaq/kIYpkCf/qY4DcxqcYxlwnDfP0//E23M+j
 ryAwn55LIHomb6v+tiwM+FMicQkBJHqfJSvFIv6iCUIRMBTzc5eth37hIZ8L9tFIwLoDBlXzhlB
 IzCjTRXfD/QlRl+c/1MTqcly4qmhqnvTOoW5NVpp1Sph6UC8va/Qqehwn4CYhCKBz08vMJTXncg
 cbnvYV/qNu15tF0YKOg0A1FENpCGoSikDdXyvoMp+21QjGICE5U20JKqxVV0Hh8tT2hWudCurzr
 neTwpyX0f2TXnrVjqS+7TlTdKfVY43j+Pvuq6GQQSp5b+2K5iB6ijUiEqUWgzcMRFlJV9QpGVa6
 UicqhtTHbo3gLc/evcWWeYkA04O/WM6zfut4OwjXeZHdqwVFjHBQaO6hDOuKQ3vVnqVYG+4G1Tx
 KV5T40VQhQNSLmj+D1w==
X-Proofpoint-ORIG-GUID: NzmEOTM0QT7dfpycgu6QR4r-1WD3Zm0W
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a28226c cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=AGxqfbsocd9TTLaiNUcA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: NzmEOTM0QT7dfpycgu6QR4r-1WD3Zm0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112206-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCF56661006

On Tue, Jun 9, 2026 at 6:09=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> On 6/9/2026 5:50 AM, Rob Clark wrote:
> > On Mon, Jun 8, 2026 at 2:55=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qual=
comm.com> wrote:
> >>
> >> On 6/5/2026 12:20 PM, Rob Clark wrote:
> >>> On Thu, Jun 4, 2026 at 1:10=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qu=
alcomm.com> wrote:
> >>>>
> >>>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> >>>>
> >>>> Once a hang is triggered by the msm_recovery test, the gpu error irq
> >>>> remains asserted and triggers an interrupt storm. In the worst case,
> >>>> this IRQ storm lands on the CPU core where the hangcheck timer is
> >>>> scheduled, blocking it from running. This eventually leads to CPU
> >>>> watchdog timeouts.
> >>>>
> >>>> To fix this, mask the gpu error irqs during msm_recovery test and
> >>>> enable them back during the recovery.
> >>>>
> >>>> Fixes: 5edf2750d998 ("drm/msm: Add debugfs to disable hw err handlin=
g")
> >>>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 +++++
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++++-
> >>>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 5 ++++-
> >>>>  drivers/gpu/drm/msm/msm_gpu.c         | 2 ++
> >>>>  4 files changed, 15 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm=
/msm/adreno/a5xx_gpu.c
> >>>> index 2c0bbac43c52..f1df2514c613 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> >>>> @@ -1275,6 +1275,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *g=
pu)
> >>>>                 status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
> >>>>
> >>>>         if (priv->disable_err_irq) {
> >>>> +               /* Turn off interrupts to avoid interrupt storm */
> >>>> +               gpu_write(gpu, REG_A5XX_RBBM_INT_0_MASK,
> >>>> +                              A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_T=
S |
> >>>> +                              A5XX_RBBM_INT_0_MASK_CP_SW);
> >>>> +
> >>>>                 status &=3D A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
> >>>>                           A5XX_RBBM_INT_0_MASK_CP_SW;
> >>>>         }
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm=
/msm/adreno/a6xx_gpu.c
> >>>> index 8b3bb2fd433b..9a4f9d0e1780 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -1911,8 +1911,11 @@ static irqreturn_t a6xx_irq(struct msm_gpu *g=
pu)
> >>>>
> >>>>         gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
> >>>>
> >>>> -       if (priv->disable_err_irq)
> >>>> +       if (priv->disable_err_irq) {
> >>>> +               /* Turn off interrupts to avoid interrupt storm */
> >>>> +               gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, A6XX_RBBM_I=
NT_0_MASK_CP_CACHE_FLUSH_TS);
> >>>>                 status &=3D A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
> >>>> +       }
> >>>>
> >>>>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
> >>>>                 a6xx_fault_detect_irq(gpu);
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm=
/msm/adreno/a8xx_gpu.c
> >>>> index 9e44fd1ae634..0f6fd35bd587 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> >>>> @@ -1211,8 +1211,11 @@ irqreturn_t a8xx_irq(struct msm_gpu *gpu)
> >>>>
> >>>>         gpu_write(gpu, REG_A8XX_RBBM_INT_CLEAR_CMD, status);
> >>>>
> >>>> -       if (priv->disable_err_irq)
> >>>> +       if (priv->disable_err_irq) {
> >>>> +               /* Turn off interrupts to avoid interrupt storm */
> >>>> +               gpu_write(gpu, REG_A8XX_RBBM_INT_0_MASK, A6XX_RBBM_I=
NT_0_MASK_CP_CACHE_FLUSH_TS);
> >>>>                 status &=3D A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
> >>>> +       }
> >>>>
> >>>>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
> >>>>                 a8xx_fault_detect_irq(gpu);
> >>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm=
_gpu.c
> >>>> index 9ac7740a87f0..48ac51f4119b 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >>>> @@ -552,6 +552,8 @@ static void recover_worker(struct kthread_work *=
work)
> >>>>                 msm_update_fence(ring->fctx, fence);
> >>>>         }
> >>>>
> >>>> +       priv->disable_err_irq =3D false;
> >>>
> >>> Ok, so we rely on recovery to re-enable the error irqs..  that is
> >>> probably ok, given the intended purpose of the debugfs file.  And,
> >>> well, it is debugfs.  But why do we clear disable_err_irq here?
> >>
> >> Now that we are updating the IRQ mask register which won't reset until
> >> there is a gpu suspend, its side effect will be felt even after
> >> userspace deasserts the debugfs knob, potentially into the next
> >> testcase. This is different from the older behavior. So, I felt it wou=
ld
> >> be better to reset this flag during the recovery, considering
> >> msm_recovery is the only user of this knob, afaiu.
> >
> > Hmm... maybe debugfs writes should just immediately update the irq
> > mask (if the gpu is powered)?
>
> That needs some plumbing in adreno func table to program the register.
> We can do that if you prefer that, but is it an overkill for this usecase=
?

Yeah, that is why I didn't suggest it earlier.  But stealth re-enable
of err irqs makes the behavior harder to reason about, which I
dislike.  I guess it works now because msm_recovery only does a single
hang-test w/ hw error irq's disabled.  But from userspace PoV it seems
natural to expect error irq's to remain disabled until writing debugfs
again.

Since it is about debugfs and a single igt test, maybe it is just best
to document that this is how it works.

Or, would it be reasonable just to update the irq mask in gpu->submit()?

BR,
-R


> -Akhil
>
> >
> > BR,
> > -R
> >
> >> I should have explicitly called out this new behavior of disable_err_i=
rq
> >> in the commit text, but I forgot.
> >>
> >> -Akhil.
> >>
> >>>
> >>> BR,
> >>> -R
> >>>
> >>>> +
> >>>>         gpu->funcs->recover(gpu);
> >>>>
> >>>>         /* retire completed submits, plus the one that hung: */
> >>>>
> >>>> --
> >>>> 2.51.0
> >>>>
> >>
>

