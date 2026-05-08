Return-Path: <linux-arm-msm+bounces-106627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PQkM3e1/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:05:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5F64F4B91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D073330215A5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8863D1715;
	Fri,  8 May 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Edcdzhfa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g72UDGjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71169355F53
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234557; cv=none; b=itIOjVqfWOJ3ZfSjt4ksFlEqArSjhwk0FgL3wI2t3+Z5lMDO+3roHIrXaWhX1QyIgJiyQdAJFmNfO4ywkswO9hknuKPytK83m8z7JT7ujohA1nsmmk28NyR1LvXA8o1yC9QkZKfmxVttC5+5tw2i2V22tXLiM9bvS+p2QpIAuXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234557; c=relaxed/simple;
	bh=WVtSLzjTVTbmEgTbjT5Fivh24TBFtje+HenDoVyan54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hu2zUDEzxp2d3+xTIMv3Bl6IALuPPK7bE3ggoJYysnt31FKrNrAbKVzCjtqGKEqDUp2t3C4BvPzDREQDWc7Amk9TIgrfGdymkN1oM6v3G/OYT4NH2eNZa/x7F9RBbVc/H8Vry9aHzUwwkTjEAvKKqNAg72hgAtmmMNeOq8eXVX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Edcdzhfa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g72UDGjJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484VtaW2771642
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qn0u2rVFSmOsPw9dKW2MjjRKtDspoihKo23AtaIa+f8=; b=Edcdzhfa9YeJJ2fm
	kPuf8ifwD735IONFXJN7W1dMaBgDUFYb8vIVJQ9fUCbPs53BXwoLtdtvYueP8ulb
	j8Q8zaUoWw9ekmlhXjmMbb7GFbSkq7xzA1P8jZvQz31winjEIw0/quuz+J7eUozS
	O70Xa/Ouyi5UofdpWvRj2x7uaxFM4bqaQg32YfD0xE6MkTPEplcjquVULFcwjP8C
	kbcC+4VL1oB6NFqvm2DgW2x3qUGdeGVfMHSzrWtV/oP9g+l1auvlpRLKEu3GgDXz
	T0vNEStEcI0DM9gJAqFR+GxkqnRXa7wehlcEV6Snf1scd5P05TMHjNfcPoKwoBpf
	6/jc0w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5k51e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:02:32 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5753c3390b3so225201e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234552; x=1778839352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qn0u2rVFSmOsPw9dKW2MjjRKtDspoihKo23AtaIa+f8=;
        b=g72UDGjJCKbLSSH5CucHuaQT3kJtZ5xKBMujDNw47kAsUPw2Z+eSaFh31VPHcQR1mv
         QtXJQo5uR+DmYxcC01VI3rDg9wJGiyZ9FP8qYuCy6JjxdUx0B3sdODFMYHRN33BzFPsb
         IYF5nnIO8hrTGfhtbatIjQlvCKuGj9hbKtJABU9oXJRe6oMeozm5Of8c1Fv6QMDXPH5y
         HWAcjki4wrscDN30S/T6dDdZ/Ppw+QKm/j7AXTU5/nmGso314vdOmtyFQ9On7fyujg3c
         1oP/vQrC5/Ma6UO1oYrgA5gvW7oNV7FPEMNKi2qIyY+ZY3sxVFHLTA5zgclwKEwZp/qa
         cwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234552; x=1778839352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qn0u2rVFSmOsPw9dKW2MjjRKtDspoihKo23AtaIa+f8=;
        b=eUH2OBdbFd5XDY+nChqhjNiRCTu1yh7V/+TfsZIKxplND1Yj5aHhzcfWTJVEj1lhDb
         hcMwtUdXRqVAR312+68fLFMPNgkdrYJBgp1uQeBktUH302PgfXdDGbyWokwQoloZoU62
         RONvPcWqwRM7WKJMSwh6PHI/kjH/l6erW9Wsor1EfH+B9HiSJIoVaLTId+YMWbatq8nU
         EBhY2tK1RTQDJHINFC+4unYdgWcBWet/5TQI7IbZFjX1T4O4VzkVMe2zCtKpkWq/mFqg
         DA6nnUrD2aX0jzLvMiMsQ4W1B8rA4ujraS681N63+EKTTcOzKHADr3xUlCRhPmKUMwg0
         cIfg==
X-Gm-Message-State: AOJu0YxYx+2kntsDPRWzeR2RO9gzOgkf0I6h76xIOhTJUdcjsmiYuvqf
	41/QdjU6MDBHmA+ZijXFTD1mDOWorB1Xl9FY3W3jxKc/9CClsSbO+7VP5XLgQ5CHc9SRFGPY6y0
	6JnnXTSV4OSbwxr2n3L5tP849Hsox0cCMaNoFU/0mATNe4NDdafZhph9FHa0+KVmJ2D7f
X-Gm-Gg: Acq92OF3SM0WpIGw+kMLDJx3QW7+N8y4J/eGkyNKBQIqdo4ZDmfQB48FTbrOOTmuD3z
	+ivwHA9dwE/dhrstkF3UyryIFETnyRF8Fm4qlU1sCfzTFUrK36BVxDzbtbxtsJBZcLQxceK2TUZ
	Oz2bZ/Gxsd9HtvHWw56GxkMEpa8tl7rSwS3pyyrDpTgD3lvjrJoXaFBswHHDJ/z9BcXliZyvkw1
	Kh1E/MQs0Ai1Xcz8d8xjgCirppkPkYgp85yn026XKor0LboJeV8Rb+DToWElCI4QUqF7Dpyb1CJ
	Am9lj6qe/q59IOszVJJEc0pi1r7L7/nfi/5zGJqKvwxq54HdLbcx6S59zgqffw9V6UAXsZ+qvpP
	hmUjUaKNyUzFz1Z0sLBGMsKCKVzNNS/eymRlZvOKG6DZgR1f+y+YgYJR1exV/1Da9qS5hyvb6hF
	AsUk9/3OUaQTeVcQ==
X-Received: by 2002:a05:6122:c215:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-57559508f4dmr2276982e0c.1.1778234551996;
        Fri, 08 May 2026 03:02:31 -0700 (PDT)
X-Received: by 2002:a05:6122:c215:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-57559508f4dmr2276959e0c.1.1778234551403;
        Fri, 08 May 2026 03:02:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac48381dcsm62814066b.54.2026.05.08.03.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:02:29 -0700 (PDT)
Message-ID: <9c1b044b-f7eb-4ec6-a201-1a1aca19e68b@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:02:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/29] drm/msm/adreno: use new helper to set amsbc
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
 <20260507-ubwc-rework-v4-18-c19593d20c1d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-18-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdb4b8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vz_rfR1X6w8aG-yi8FgA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: bhSqWb2WaeLRLIIUIGJjGiVLnA7sa1t-
X-Proofpoint-ORIG-GUID: bhSqWb2WaeLRLIIUIGJjGiVLnA7sa1t-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMiBTYWx0ZWRfX+vQeQk9eIHkX
 MNdzO1S8X5DpOpcYybpnEAt5778OrWb2jtvj68UDBxAUsffiO7u+ULUOrsmZvFQcKjLYrGMJjSy
 a7lXUI4HE029wb93r13ZnWh3Kog24bs6Q8lvWeXmR43M9y6InfTJ5/QVBD1blY8VVPZs44iFsux
 lV34Uia6jFpXPH7caZ4YBAfuEthCWAS2rfCAJ6jeKiHI9DNAb7TPDu26KQfAhBAZ4nGba3gc0Gp
 AJkyMfnoRhMLK75P+01GoZp1lKVKBSfxMps1l3Gm9fKJXIV4T00UxHcArEdFPZjnhLlaiAMsUfi
 xVntFXqi3GDB5oXwZ5EJH+e0yKExFHW7CNSegw0dyORiijVJ8++iKKycpx0lP52Lp2XfDXW/0sO
 khGliA/pyFh95pkYkFWcRpxEnFG/BqCle8C9qzPMdX2VNInZn9hKFatHHO8Df+1TPN8KpjwiaTJ
 iNqkgqQMRUXwtBZHpSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080102
X-Rspamd-Queue-Id: AE5F64F4B91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106627-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 3:03 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of checking the UBWC version
> directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

