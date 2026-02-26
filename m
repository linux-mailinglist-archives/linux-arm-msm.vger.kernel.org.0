Return-Path: <linux-arm-msm+bounces-94312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNfzFdlaoGlPigQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:38:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0801A7B67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B9AD303CB10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920EB332902;
	Thu, 26 Feb 2026 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIP+FHML";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKHbHrka"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C838242D98
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116672; cv=none; b=kW3EjXkP7D/DyUn9IR9GVnS0O+TMIQcCvl8qC7fXACVB6XGf2bCYBEamDKF/OqLwzlNeY3l98+LOUIYMyXQtYjZGGGvKL0LLnjnNWIrbLmUK+pR/E7d/oE2x0AgzALaSvnjwX0aOZGnOIC3TGXkUcmB3pdYmhC5kwRqj8e4kpIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116672; c=relaxed/simple;
	bh=2g68O7opv7WM3JKoSDQS+/MfwdBIGS1lfiSUXEpO9Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOkxNUzkbSJkZhDH8RcOe1FDc5l95NrG5xUI4SabqmC0TEY7Uy7npQeyiXZDrbSj+qEPXPEB60UNESI9TcwOzHN0lx/sQvLVRrEhPyyfgGzr3Z7hPtw5DCZPrm8TKG6DKlZIL3OWuWBDpe8MOIJomHKo5IoyP8xwuTWKt/mgEgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIP+FHML; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKHbHrka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKmRY906845
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=; b=OIP+FHMLn2yvrtF5
	+ewAYmby+R+lSHLNMgAEeYyOIx6mq3zMIWdCGDRCizVhuYpt2OFMdF2+GCpJGEaQ
	SobRXaCUckNuM1dV0/iQiFYyk2eW8UCiR2/gDLMCue1nebLg16XEANd9AGwgM/Vb
	awvyIYJ9wF34IEdPWpw4T5kAqw+yM7f5Gso7SPf7jluXGuCBvm1t9Pk4Ll9WDDZa
	zRVGmkDkIgu1aAso5i6Kwbkg7AmZH7nSJ7b1BxbZ6GlSWXlzE8FieqpO/zTEq1Af
	qRTsWU2dvT9Ce/4E8QTRrbD4dIZVMnKXKQutcMjzDkZvTq/zBvN7Gv5vtNA7H1O7
	PtWdqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v10f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:37:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so76084785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772116663; x=1772721463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=;
        b=BKHbHrkaE4BT52sZj4iJ6+I6IcAVdfMPPXCeCtCbx/kemPXJgjMnea1tgG3uQT/r+e
         A1xIoP6fPD94m24Mtt7QHsaVqps1ctk/I/EwYiKKLmVUkygyeNuGVcoeovrcMq74kfr2
         eig/bKE5qOBqPU+jqwPU97dy93cdnobkLmh5e8ubOFwXi4Ubqv5asg78L8mW8qomF43v
         1WHNdxCsELkVT8VcFCUxo+bjbUvCFA6pNwl1PKVMDm5EXJIKphwsTqaGmsZqblGF+CVp
         guAILmLIATgCAzPQht8bOZhu24eJnlkrFNmJVF1g96Njd75N/4MJc+vGxBX64bZDCAtc
         B0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116663; x=1772721463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=;
        b=JZxD2ZuHw5yXcQ/Yw0MNKbBJvyPpcjz/UKuaYmbvvPQsJyCzlyYgsiSu4QVllKoqT6
         gT29O86ZlzTmY3/zx5IIMLtpdwy7rqQVdGBjTSFJjGzbdR58D4eGM1Or4Zs+F4Yauy8X
         wCeey9WOupKs8IJ4jPqfxhbdY6yNGWIzWAFtEfOhmFxUy9MOaJRIW/sZNekjCg+rptoT
         P83f8zNmFMSd+goVZ5mtAqE9ghrV4uGBiCcAFXG7z1e7T8C2eM3eDZnjUa/yFmeZ7qf2
         0L/2fKUb80c1Vp8m+Y/pJ874Br17V7WgY7aBvq4CGgwp29fFPLLcjI/fW2MXs+YTwk3o
         BKhQ==
X-Gm-Message-State: AOJu0Yz0zAgnzBsHu++XBT3tVFC+72RkdXwoTLbB7WUtFmBWGCcxMn6b
	Lbs8t8b7z3k0t6vpxm+y8BVEthweRZ2/tEW7+zNqOnkBwF1BtABMVVT9zdZOBFFoaTQeIP4+TGB
	B1w3UNc1ztWb1Wqda+faApa+mNTPosTYxSMtvO+xWu+zfo8j6qIh9z8g/BPQ6HJlRKT7J
X-Gm-Gg: ATEYQzxsYs4e9vAFhtRCCS3FTMXxaA30AOryXePTbUDAv60yQCJHyHdgkCp58iCxXLe
	aL08SFZqpr4EBqNzz4UhKpKn9pAJUO+xVqtJ23/mopX1fvTVMZ2O1lhPczLaKJ61wgg+oIUDf/S
	7mY3bnMDjFbiDnKLohNC87rWHqfuayTLfKkBkAu4ixU5v+pBCGjBLRmrsk+GziJGmdTUVqNQYMs
	ExXWC3RTVIbDlQxgV92APPz8Ia7y5imAyVTzH9sCEbvFlWd3PrHuOM0AL38+QbDH01skPyoNY5G
	nkOpD6fvxzxgcvK9pWkqMWvHVnP8C9fI1wFDyKuFRSenjzPtoOedXTsmtt6VRxn7W6D6iPD53+W
	B8WuwcSxeaxJBmiUkknbqCcDAO7AoSLH5mgAALW05jy7wXEUhnKJAKY/mt3QY1oCBjEBmTRkJeS
	MnGdE=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb8cabef31mr1935601785a.7.1772116663415;
        Thu, 26 Feb 2026 06:37:43 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb8cabef31mr1935598685a.7.1772116662812;
        Thu, 26 Feb 2026 06:37:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6d1c6sm509000a12.17.2026.02.26.06.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 06:37:42 -0800 (PST)
Message-ID: <77f52ff4-4b6c-4f50-bcb0-51b89e67d0ab@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:37:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: lemans-ride: Enable mdss1
 display Port
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com
References: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
 <20260226111322.250176-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226111322.250176-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4DBwOE3osFftxDRZCZznJWuWaSJXoRmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzMSBTYWx0ZWRfXxiDjfX4pEVH9
 PBzAfp/FoVZoqle1PJVzbOwDOusFGlSP2gG+Y4juseK1UkYP3IxA7TgQLgI99Lf+KjbWfEukEhB
 qdO8euIZO7jRGYONpGop6rn2DG6vnUxzhx6RfjuNZ6fY+X4uiicrvq78cUz7VZeVeMIuS9aUXxW
 xgm3VgSnm9jDNqyHAW62jvKCeT2/dNuYYj40VrA/MhK/Zsyqn355ozVuAyy2/d/5pd6Ie23prhn
 X29ooopzXvGD1Cs66n/BxwB+wkID2luAI2+WXfeK6fS3sshfM/YgCxzC5Ut+YH5WBpg0DQFMbJ8
 oVigCyPNL7UR0blGJuHKILy4oo9YONEvZaj+TdINI/8hWyX6fKL6MWYxaVvV1VDO9yyq8Ar1V/i
 1aqEeK9vrabwt4fa4IqAmtQnXKRNr7Tg8GijhDqQYrfqmL/V4E9TCDgijyG0bBVjgfWGWskjJl1
 u0AAXou2g4AsSpUJeGw==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a05ab8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XQLX8yjaJUNYVVxXu1AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4DBwOE3osFftxDRZCZznJWuWaSJXoRmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94312-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE0801A7B67
X-Rspamd-Action: no action

On 2/26/26 12:13 PM, Mani Chandana Ballary Kuntumalla wrote:
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Please switch to using b4, you omitted including a tag you received

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

