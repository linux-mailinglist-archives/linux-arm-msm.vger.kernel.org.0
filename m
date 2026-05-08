Return-Path: <linux-arm-msm+bounces-106630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMxSNqa2/Wm4hwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:10:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7014F4CE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25D733062D95
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D072329C6B;
	Fri,  8 May 2026 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTAydDuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O90Q05f6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009CB2F3C10
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234817; cv=none; b=lJO1KeR2d4sG72EbZajpgAU3rhxAR0FK2qZhA34Pqv4wFF0tU9IQHQoac5dbMsJCsuq1rHxRJrqBSW8g9nVH/4ie7SxNjY05rCWlCdXBnzdUq7scJhdPM7BnXAxm9YnIi10ZoRKHqd30lKImZvOI83DHsJQgMicWuHzUcik7s5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234817; c=relaxed/simple;
	bh=IwO1X4t+OJ9kX/kX+MEfvFtaQifHPN6QFPo6YkTnnY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cV2OEGSj7TiY0W96bTG1ZI3FOFrSpiS5WDQSI+EpwUuimrHxWDnr50++RFJeMhvbaqkJ9SvcipkqYWHAo9Qmp27RXbWp1m/T3D0jAgXCDP/GUMd2lw/aG0i/Hpwg8zr+Tp+hs0WCIcryA7iF4RBH9rl0lBuuxQoYhBbEhncp6QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTAydDuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O90Q05f6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487OiHS2384344
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGR4LdbXleQPAwUEukrHDtQmkBd3wkefeJbVg2vCkPg=; b=eTAydDuRGhO5RWFD
	nDo3QtXnS9lNLSwxdMF6eVpaDOqkcshNTPpJszckkdoMEQ4Njgt+EH4oWrwNS8g1
	DPygtMIkkPvkXGMz5t4PIPDDr/1Bcb/J2N8gCrsIHNL1Oc0eB+3qms/Giw4CXteD
	U7U41C5NlqUvgTAf/V3OHsUcB6aoJN+fih9k3SJgQUGrISRncPL72IhqLma/LKbI
	+0qTTNdflf6jtMAoOrZ3GGnrjnigTOY8MEIlr8vVJT91UGsp0KJf5n1AAXge7IBT
	mZmdePQhe60GrOEJtm5GcUUV2Sv1wNX/Ts+3cuwEQGwrFi9qvf6u8IXqQFMWIB/4
	dncPEA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukjpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:06:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e576143baso4304071cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234810; x=1778839610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGR4LdbXleQPAwUEukrHDtQmkBd3wkefeJbVg2vCkPg=;
        b=O90Q05f6TG063IT90klxqPXYbgxJCXyNBafKqC+Z7CjGaDAF/mfLvNr/s5jz9aONgk
         JeAwFvacKYTgbJeuVbfKOGOYz1AjSr3ouM6aVwmaNeKfkc2K3Xt+W9mt+kwwIg2j8Onu
         fGebQ/cIk6SehH3wWpNBVyiY94Hss9gPpMbkR0GmIKnPck7EQ+PucPv/MWX/h1hdfqaq
         ko0wkoQOM5SZZXiFixIcamWaVBktWy1xaOTeTz2cpLWDSuSJiTN7gn040/jJU1C/4/hZ
         UAigINSdJvzX1ONpWd7OcMJTqcs5y/brat6T1tOKE7cK+misvKRnsI4+qysz6zxapQBr
         FCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234810; x=1778839610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGR4LdbXleQPAwUEukrHDtQmkBd3wkefeJbVg2vCkPg=;
        b=rWlTSViynsMTp2md1/303IApr0kPgJgbmI+0nt2N4V96lBMa6YAQf6vg5/pcnKrvhN
         y5q/Jodg7nQpMhQ3BvOs3EM2YVeOfDhzx8GQFRC+A7L2tOQnhYC8B2JMOed3fYMmza7f
         RMVbtVBb84zZd1odZjdh+FaxMtWdGGWAwjp2DYedSxJNL9wed83R3/+WfhPAI+tAXZuX
         6f/EUE033l7ax3C3X9KNq3smy/KAiZPqIcFQs4ZOtHBgU3KNDc/cQIjBe2k0/Xxc+w/w
         txEmwfHLhygm0ZPMDpqWxVJYGUhSyN8g5nz2YktN/SnLKckW8kxEMH1frLR+PBLxQ0dE
         xKzg==
X-Gm-Message-State: AOJu0Yw0+POOwiyAxTHHoWPvhzt0ygNdWbC4nmtjClL9IPfYzyS+qw13
	DqJZBvXxJS2k+k06CIdRWYw4cjmd7IIfK1wtwnSARfici5EY3g6kRQJ8K23e8axIUpcm9NYXbUr
	Ye59iaYad34EUSHNoKVTsJC9Zm3xe6NWZk/HmwANX9jg/oGlL0yrzziAetw2Z3o5ZJr12
X-Gm-Gg: AeBDieuVhxkOXolk10e8g6kDFTtN3q1rD2mP+4dMJxPnI55Rd7d5xThy1jLDxo4DtgH
	+7gBiXXVycM42U57CTpzfGSQJCUZ2GdsUo7YtXdIrbz/FR7n/C1JSQST9eODkmEdhkaU0sQPqR6
	jgPw4Ywp0QqNtI2BqfzEYt+cI49R4MClnVyWDQzGOoHrlKoOUCUgSnPGWb5b953UtCYK1fTu73r
	gelbd/v9XfdPn+bDnUcuRuYwBZVyG59b7+hyAv0YQllpTXE//5onDGfhAWkKYGWOAfZaEPdzcYP
	go9CcdbwrX2c8wDTZN8sNIbzjbMzs6v5wP6FIbkLd8jPTz8C1VF156UrA3VBxNeSbhJBzLIP4GE
	JtoGQP41mh+SimHdB59o+mDM0KmFjjAcDlX83uU9ZWTcSx5fwr6K94FGfXPtuTNDKa86vIIHWyM
	3+Emg=
X-Received: by 2002:ac8:7d47:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-514628a96d1mr116851201cf.6.1778234810632;
        Fri, 08 May 2026 03:06:50 -0700 (PDT)
X-Received: by 2002:ac8:7d47:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-514628a96d1mr116850751cf.6.1778234810224;
        Fri, 08 May 2026 03:06:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1c2f9sm476346a12.28.2026.05.08.03.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:06:49 -0700 (PDT)
Message-ID: <f4641fd1-9fdd-4908-914c-932943d58754@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:06:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/29] soc: qcom: ubwc: add helper controlling AMSBC
 enablement
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-4-c19593d20c1d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-4-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -4UlH_5xC4dKwpv9aO7yiTQa2SReiIO7
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdb5bb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NqI5fCEo7b1so1Dk8qgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwNCBTYWx0ZWRfX4kidoAgoa7/k
 fruPRpu/ouFQtNpKe6yGCS3a7J8MIyX0KnVPv1aQi2kppdSG71zRobeD+IQmKhR+UpDaQV6IgdH
 bJfOOXfm6w50TSKvN3hcz8XFExwvWOM/1/7V3T+K6vkksD36N1qmL0uY+qRuguaIVdlG0iCWmN+
 +bfLgquQGBiTlYU/b/LErOZlmmX1srl3LqMpgdYRrbG42apqNQq0KLicpUurX+eTrEx6eYZYVq9
 v+s37kW6RkOWN5xmODXwDd7VkSFK2omru9iDJYnPCS/aG4Tx2Cal+T5kzWH3QeB8i5GpjIE3l9e
 yj7tM30dHvLYiQU0hiuMftz/hck524tQ3g0og4KcBK58gy3teuiGDlOqn+SrXMztOXxFJHJMaWg
 14s5Dpy03QDo/S4GaxHhnG90O9wtNPvORHDzR664Nkzn+c5IxWLnLP31dezAOGxQ+XYbC2WkFel
 makNlwxQcSujpKjCkqw==
X-Proofpoint-GUID: -4UlH_5xC4dKwpv9aO7yiTQa2SReiIO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080104
X-Rspamd-Queue-Id: DB7014F4CE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106630-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 3:03 PM, Dmitry Baryshkov wrote:
> Adreno and MDSS drivers need to know whether to enable AMSBC. Add
> separate helper, describing that feature.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

