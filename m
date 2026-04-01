Return-Path: <linux-arm-msm+bounces-101315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJhVJzr9zGnRYgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:10:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A04379250
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0582C30160C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2854E3FFAC6;
	Wed,  1 Apr 2026 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M24NojE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBZ2LbkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E813F3FE67B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041400; cv=none; b=CtjRJVZ87AweqhbMCgPe01SmMqA7vxCR7b1L4lW7Gwu4136h9Ifz2oKCFETXIIys2qhBWjoiCK4f7wdUiFu0n/VpTdlHrw2iujuGvv+AApkdGqDB1Zh+PazjvlamypvIAEiK+zwCZl+X1/Q5U7zP91uar14uR/ar8bG5M6imkCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041400; c=relaxed/simple;
	bh=MB4LMwSHBiafUcSOtiLPU4dOU+C2pFEhAewMAne9QhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1yN2g9F9qm56E7syE5iw6l09/sWc1RxFzcVdIntNEyu8HrXoWJyi0jKdpyfRRVctBFSHtIsOrQ9yALh7UGkvhXwJT9C2TyoeHBPZmejjKVn6dj3dyLCLd+Z/QHVYowt0EaiNC6op8YHmR3UVxorPplfnHzf+eCUyQBgVroKPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M24NojE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBZ2LbkS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63182d7X719319
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SWnjJe8ds7N8QygyW4Df4rFv
	J0LrwnucUsnXNEwaU1s=; b=M24NojE2g/hqDt9cNm8hFNW6ZMoQGEZ0F/Exmmo6
	0KHFYpxNy02wYxSs8D26RplmzysK+e2Ch2aW8jvD3yC0LoAjzIsxyzY09NhGy1fD
	Y76t4r8wC5n5o4pscDt/zUVo6DElDICEZvYBxgWIYax9fKx+YhtM/VLWhPPJBmc2
	5XOd3nEXM/3v4o9X2gIHBNBIE8QIwRdYCt1+ZNy1SSmS0tqhRVvOAv/XvxUpJFvO
	nn/TIxv3h0/QZp4c9CBqRpQhwv0OXsNqVYfgP1j5AxR7m0YTbiI7+1I4DwhufCJ5
	0by6xx3ivdFaTcvho4+sjmbmR48MuOAHUtxEcIy4T7dCpw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsumx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:03:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56ce9a926bfso4174557e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775041396; x=1775646196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SWnjJe8ds7N8QygyW4Df4rFvJ0LrwnucUsnXNEwaU1s=;
        b=GBZ2LbkS3NWPUxX3BDpqm176zzEfNxU/se0JNHD+dqYsOKmdViQHnkPSEe9Yt8feMI
         CTuRLibOROVOf0mhj7NGm+RUZuJZgakwD1TvsJQSO2DTC+QdwkvK08+G1M1dv/xVnzvO
         mFbeRaeQXlNRwNYZVSTU4nGl6yrIc4aVbN5LfEFXcZ/k/H0uFx9DJAskny7A3I2WOc3n
         o/PU/PPACF2mwSjRuJJvpWIYAT7JHIlm+HaHPx8MctNgvPf2f8fWwvgrxrF5edLGdpA6
         kiiqaU+y5zVgldzaPi0NnZ48AVulCtXISgRlKvOWswXluZsABLBdCxOjghvA1OomtkuP
         7T5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041396; x=1775646196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWnjJe8ds7N8QygyW4Df4rFvJ0LrwnucUsnXNEwaU1s=;
        b=NWZ6l2yo8Qundz7HDhWZ+4cJvHEnRDh+oeyQ0tFi205L4//YC35W+mgfQdFcIK/ZCa
         +IBYubpquRYnGb0jOJPo5ruAnOax5vnMzUBJ1RA64ZkLBq2+J81I59tEIGdSCArjjJq4
         g8eb5/rhwtfQdEKMoG+QjkDBklaEuiuHeIIrOYqU0Y7NwK4E6tKvwCLjxE/KQFaUiwQh
         Di/OfGpKgt7LDBNg8jkfV3oGdtGyFlwTq2J1VIFVXkoFNuV6DoYhFvR7gHnarX2mdr17
         135X/kzFAcnidn4DTUgvLpo1oqM55DI/3GkwyqFumFTW9YUBQq/mmbN7mqjK6xDNUcbC
         n2eA==
X-Forwarded-Encrypted: i=1; AJvYcCWyCE/nudygXp1xtnwG1v9SfCsXVMyfVebTpaCgvOtiSt+G9KDTdLrpVECBKlbObUB/hQutNRQLg0R2XG2/@vger.kernel.org
X-Gm-Message-State: AOJu0YzenDLR+7ZXR1AUc/C5tVGd1GEayevlQq55ERZo4M4lTYinpC8b
	4OsI/eFiNPlRLsv1da7tnMhqEREJAjRaIj7wUSyLrNrWvpi0NYnlznnaADpfO2t/OEj9ET+HPjR
	q4YcwMNv/75ecUDta5crQqKE8KNRmRS9MpZ3RssXtBqIz0O1vFqdHX97mQ/wBGg/7/cyf
X-Gm-Gg: ATEYQzzkjbHPLJuQDvGoASBjZKqm+pusPCNTHtIj2EfkUQlNo5YwZtt0pzDRhlsZkc6
	MReJrXel9qTl8Se9swMrGswFz5510Jxy1+vLKbit6FkCZF1jDXfOgKVc9GysEudExh4hmHYCg2U
	G98JiZ6btidU8FBQAIlyMcealQQ93XEHDyo5uS1/eqtnVqBWargCU4erEKYNgwpF9qkWnJ6sSWm
	fxrgpiyKHIWOV7QSoQlTFRUVp6KhW0l45iAPlpiyyhMR48VYiutpuYHMNkOe5Ue55fY0K81ojoq
	HQjM8+wl5yvn1S/roIIiXLb3xsAASi+5N2UlSe4l5xtZlWuDZk86PC3wRzOUe4uCJw3NAQFEhoS
	wOrhubvr9FjQmRoEOLERsTET37ZPwQ3d/Y2quqS9kaZA5oJsYqH+grqgPKr+NOhnnG8eycgDcsR
	CSOoTUIRefluypV0UTd42Eub6zuWmNZg+aHM4=
X-Received: by 2002:a05:6122:6089:b0:56b:960a:a4a7 with SMTP id 71dfb90a1353d-56d8a85f818mr1385087e0c.8.1775041396083;
        Wed, 01 Apr 2026 04:03:16 -0700 (PDT)
X-Received: by 2002:a05:6122:6089:b0:56b:960a:a4a7 with SMTP id 71dfb90a1353d-56d8a85f818mr1385036e0c.8.1775041395591;
        Wed, 01 Apr 2026 04:03:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1456dffsm3176792e87.70.2026.04.01.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:03:14 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:03:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Message-ID: <q2vthozftjqrfnjtm4e7b56wliniic4toqoeti7rzyqev2yupm@nxc7ejpfa74t>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwMCBTYWx0ZWRfX+2yXTotyL7+/
 6wn+qOvcN/l4IutoLP5tgUKmo2Dgy7woL99BthhEMvjRBf6KmYTTY0twGaPBbYFj2F3nCSGHGjV
 J3jXRO8qCYX7+ImcMwH6pv02ytgyER+A+sya7Xqx+A6MHYCj5SDhDh3+SXUGvW/MaSXjN91+vG4
 y31LJQ1RPSbfwt8wYwD2pq6X4ChWvA4ysDumJYwePOwIp78acSzlY+SbBtm5egYy11T6SL7Ra7P
 Im1SvZGUNQiPQMiS/zNJiiutjsKiEEWwq8LXivoOrPyINLaBOYNoiq/4ihWSLTejS+utGHn5n8F
 uCTKQmpnB16OkTbkFVSEd+9HoIX6k+ZAKu21h9UU0Qrl6aqOH5v1ldbvuTcp51NlQ3HmZwfkYlZ
 YImpZmRVWlfE78LxVDJS38tKk6XdYLaL4nFN9BNPRQmTpReaUu/Xs1scA9RWz5v1p13cgvFBus+
 0RspuSkBy8NZCq8JU6A==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69ccfb74 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YfhdKQME_ACdFzVZc0QA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: SmPV7JgCjMil1QNm0rPXRimV3H98vjb3
X-Proofpoint-GUID: SmPV7JgCjMil1QNm0rPXRimV3H98vjb3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010100
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101315-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47A04379250
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 06:24:41PM +0800, Wangao Wang wrote:
> The Iris block on X1P differs from SM8550/X1E in its clock configuration
> and requires a dedicated OPP table. The node inherited from the X1E cannot
> be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
> be applied.
> 
> Override the inherited clocks, clock-names, and operating points, and
> replaces them with the X1P42100-specific definitions. A new OPP table
> is provided to support the correct performance levels on this platform.
> 
> Depends-on: https://lore.kernel.org/all/20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com/

This doesn't make sense in the commit message.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Other than that,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

