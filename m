Return-Path: <linux-arm-msm+bounces-106470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ArJHoqz/GnlSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:45:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE954EB488
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD8AA30779D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4296144B677;
	Thu,  7 May 2026 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/mPlGnW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MCyPKZfw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504A3E8688
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168560; cv=none; b=CedlHsZyKrpgi8pXUHbGqK9Uuc6bjQ2YHn9ylHildK1Q9uUDYkIlv7tmFYIbJTi8hCX941PuL1a6d721kTw9zHecTkE6hIu9crNIa8o1PP6BOpgLXVSji0Hy8rzlxENaqH6incONjnLEqpO5m9wO+VxYVJXYQHvhugOiiSsKtIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168560; c=relaxed/simple;
	bh=bDEGHpJJMjUGNpdrm6oZzLvuAqWrXFR6LT6b0FoyShY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSntZV7+wkc+PXKBgP9lLdJP0wvsrjlYJWngP1Ccc4RrgiUGN8NdTdQ8LEfcqdqh2EX71Dn2xC53l4gVd9bCppgN6oKDIqR6zDZuy1SDRSBm3oTaywk6YLdOVlu/ycc0vfSywOo/xNutLf7V+2ty0t7jERpxbKp8MEqAo7Wj/ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/mPlGnW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MCyPKZfw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647C5db71971858
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 15:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IK8JA6xLLQG4xNqFkeo5i2J3M8AwE6anH5GguOVZrjE=; b=Q/mPlGnWs0ZtyFhW
	Sv6EoVqU+Vb9Yz6d++gXgtCGfZlVvdzSPCDyzgF3TQaZ1fW4hZ7UJz8hW+5DfE/i
	wFcHsgOGBSramZmcQ2fcQXypaC15q+WBkaX0zi7RWSjz0MQDnjavBXW8jSGtnX2d
	3Uh+ihQ9XmI/IGDKPa9LYZiZqglFU2Tnda19CcdDpNKY59zLzQ9+kXn8LcIRGKpC
	nkeiTKXUWiP98lBN00gHA9NXd7qLn5cRlApcM84XtLtrQ1MWxkfnZZfNBCYFth+G
	gPlTAOKaf1ibpTiaBRGjy/jFXt9i65JBSfynWHejUeFdyRaSbB//a5efNsmLPvvN
	XMthlw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej8vss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:42:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7c904d476so12237125ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778168558; x=1778773358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IK8JA6xLLQG4xNqFkeo5i2J3M8AwE6anH5GguOVZrjE=;
        b=MCyPKZfwzFf5fiZnkC1nrieL8NFo/J4VC0NoPebQkFFC42YWsR2+NxFjXV4IcVm+2u
         8M1sTrj+5HOdrh+tRsQCCe+6tglVJ9bjQUNz/wIp5Jj5t3eRFWWrmDLRnso7RZDIS2r5
         tiFSQ2ut/QYrsz9lcS+xA4HSwe440oza8kVVwHJBG9veiGIAFNRBeNrfWnO6qK99MSTa
         57VhcvOtha3zuIUW414YwGuqO1VIy4hL6Irp7eoJ3+3LkGu7rvYWXg00vf8byOJjYQhJ
         6dQ+J+Hu8qkVC9qiQrm3gAbr0qhCxeS5Pe6relEkXGL+oOJDMHm1j8XFGO1DSpcZlDdR
         KGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168558; x=1778773358;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IK8JA6xLLQG4xNqFkeo5i2J3M8AwE6anH5GguOVZrjE=;
        b=CXcYbyWfZHBIuUW1fsqtNag7uxz3D1DHbrwMRzKjXlQRc/R+Pbu9Cq7Z9gf6RT96Zr
         zC3kbdyAILxEUj8iALpmkq4DtUOP1v48+2vr8tIPrZLZDrY/7rmUIeY3X0YSQJCS4dwB
         NDCBu5lzjPN05y4+ve0UROqB+6kTMaTMeh+9UGYEBVxyt5Zixz8t8DaKEdvyqXdq5lpY
         wUEc1+I2xx8NcfUJwo6yUVG/4r+gjID5F2CI/Mgf0wcUkPE2jRoUlyJnZgTcykg8X8g7
         xMOy11/d0OR2HaZi2LeKi5t2Pf2ERLthfq7B+Qnz+tdEPsn6cqWs9zedDTRy4HkTCBq3
         qSlw==
X-Gm-Message-State: AOJu0Yz9OvbMRPiD+PiXwqmW8cp2BoUKzOXwX3bDd8zo5VvxyEEffg84
	7amDPcgjzNah65/dKwzvA0sYzRm+84MKuLgB9pZHFZAqWhLgmH2xHe03MDW3K5jq6BAqweNLc2W
	5x3kZfJYw05xtSGJYhTX75ALn+d2hDD6Ct93WWCbsjZers9AS4rZjwX0U1IVh8YOe9ORe
X-Gm-Gg: AeBDievjCITnek6FckqgghdSvYVHaJ/xuiew8XsuBvUy7scSMqugGFYiFQ+gbFSJ76D
	z7FAMPvTzCR6oSuG14XA8CAIBFgTmcgB7BhhlCGYOHs2b1wzKgh2sMnHk6p2mJpm2CuA4mR64j6
	qXwsrRDg3Co87ESmtx4dPaWMdDzRJOd0W5FZ0ICx4UiMiRBdSzmbKM5C6ud4WaSZ+vYKplkooiS
	SojF2cgnOlrQvzfauYxoBsQI1uti5DwFgMFbGlJ6oNPHrjbP2EqNian75ikTTtMldtcc8VaLx5N
	Ol2BNJBaAbCuPQJX0hDn4sajg1jb3smsnnzW+rUYe+qzluWEgLsfbvvUms/t30EH+tc4pXDgznO
	LZEoJfxYrztkoS0I9VFvsBdg0xJXSF5Xg7BzibRA6XInS8Mx2vXI6ODRVDOKpuAanHA==
X-Received: by 2002:a17:903:4b0d:b0:2ba:4749:c9af with SMTP id d9443c01a7336-2ba79ad0c52mr82610555ad.40.1778168557624;
        Thu, 07 May 2026 08:42:37 -0700 (PDT)
X-Received: by 2002:a17:903:4b0d:b0:2ba:4749:c9af with SMTP id d9443c01a7336-2ba79ad0c52mr82609665ad.40.1778168556426;
        Thu, 07 May 2026 08:42:36 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae75575d4sm1173565ad.19.2026.05.07.08.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:42:36 -0700 (PDT)
Message-ID: <a01f4b67-847a-4e46-ad35-856a437adbe6@oss.qualcomm.com>
Date: Thu, 7 May 2026 21:12:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm-smmu: Update the description for
 Glymur GPU SMMU
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
 <20260501-glymur-gpu-dt-v2-2-2f128b5596bb@oss.qualcomm.com>
 <ecf6f144-0873-4f75-81db-c11f4bbfa679@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ecf6f144-0873-4f75-81db-c11f4bbfa679@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NiBTYWx0ZWRfX49w7OQAq9Hfc
 z0LglhS6Bn1CmIpz0OcpCsYJ7QfH5Q665EzRQPTOMZpTMBxhQi2y7u6kU0L0skjZNYB85aksjyA
 Zx7r3xj2KNIDAGOT8euBrLwTH6nMiJb9aQiqDlI1eGpxcAPjsIcHq35U2GJYPcd4G0tpF8ReK7M
 9Ba4LmIfT4dNnKEx6hDsJGkaGZ6VYNFdRasPUOeKS6YxCwwDaZDyMz1dTXRqu7Nc2K5TJmyd5Ww
 zD6tDcNEJEvTl2UVFFBiK9bgn3vd3X8tq5qW3E0P129iWjaK/bfKnWeB1QUAofG9VmYcwSlIHyr
 1V6UvYJSLi1nswTX4IMYo5p7bV5fxAR3XwlJaKoh9xVYbAn2Jf+GWMVwBQkKY8iiaHsZV3fJUvI
 n0/BPInjIXHNPoyK+P2DwM/McisRHTPs7tzvYneuPgm7dmbIiiBR5B1P+0/L9CPjh8idneBgYp0
 1bNaGqm3dk3j557HczA==
X-Proofpoint-GUID: lJajnU2xu9qmdDcqLxr7FfxVPttLFBef
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fcb2ee cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=u5UU4oGBB7bzvuaK6rwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: lJajnU2xu9qmdDcqLxr7FfxVPttLFBef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070156
X-Rspamd-Queue-Id: DFE954EB488
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106470-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/3/2026 7:44 PM, Krzysztof Kozlowski wrote:
> On 01/05/2026 19:10, Akhil P Oommen wrote:
>> Add the interconnects property to the common SMMU properties and extend
> 
> But why? And why SDX55 (or any other device) has it for example?

I don't know the reason why this property is used in the recent
chipsets. Most likely a recommendation from HW folks to address some
stability issues. I need to dig the history.

I just realized that this property doesn't have a user on the smmu
driver side. I think we should drop this property from DT for now and
bring it in a separate series along with the smmu driver support.

-Akhil.

> 
>> the sm8750 clock description section to also cover Glymur since it uses
>> the same single "hlos" vote clock.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> 
> Best regards,
> Krzysztof


