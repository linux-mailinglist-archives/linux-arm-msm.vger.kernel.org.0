Return-Path: <linux-arm-msm+bounces-100471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEITOxXsxmkIQQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:44:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B357034B363
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 215E5303E7D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A0938C2B7;
	Fri, 27 Mar 2026 20:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCTPrkcs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ecWFi0aQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651613644BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644243; cv=none; b=nGIsIsRvAz2IxIKEtCpg96jd+KdH5VGNgWGesqUwcbPzCRpURZt9xOPifiXrSQVEnb6oauV6xEsAKGdeFHRj/x55UJFQE5YYliQDC0i8bmUUWkG3FPakjcVK/8CwnBvDnenNZYkUW/WTUW3EXHe3+bb3UKVfB5m7y3OGwH7SN9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644243; c=relaxed/simple;
	bh=mOnZZl8eGcDAezHS8Nea7ITicfpyfIqJHsd9TsL2ezo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gpb34aXjtA4SdM4gVg4Sooh9DZs6C7H4uXc9bZ89sMvoWG/9+FBFH4TOMO8PGcIFcEOndhM3QF0vrMVtX+nyzT0QhdJ29uQ4PTiBfp/viTVVo/tPiIXDDNFK5qn6tD1hyx64BDgzOqUhK/MsGH5x8m6LN42j8dTjh5FrEI9QD58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCTPrkcs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ecWFi0aQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2SNP4030525
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZS7/E2sC1kaZB8E/dQAOcD4c7Mt+5yw7HMOSuN8HZGw=; b=aCTPrkcstZuf7IVs
	MTsiigd3Fq9L+zlA8Ceib+PDYGII/rDhLUGridApZwDV8OA6ked8ry19ldTz6ypW
	4ob0SsbkvLsO3svFvAWj4AafpMWvNyVQVauaNZtd4IY2+fiiMq+hj+W0nR92gyFu
	2iyi0BOHiwCA3yHl/w7IswBX/hftqL8nA1aM5Y+7JbrAG86ATMYxTsVj3UxxIwZE
	5tGOZjlzk/4kfkxER0pJzgl+TvrWaL8QI1kBFWJ+rLbm+V471SvuZlUhUQpIwtk2
	bqNYDMNsBTYQHUTAX9u3Cs+y+XF5tOjW7XigsHGVe/wM5p4jAgnEOOTQOuY65JCi
	tGKGXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b13t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:44:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b92f327so57130751cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774644240; x=1775249040; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZS7/E2sC1kaZB8E/dQAOcD4c7Mt+5yw7HMOSuN8HZGw=;
        b=ecWFi0aQ6a8ErysH70NCEOLl5lxxnywwu7azZMW+5AaDj+1wn1cba9/AQ7uF3s6Ac4
         juYeFcrGJfzxVErMFy4apj3CUlSmxF3FwjZpU1rdrcvd9KM1GN+8QeV8KOfojSo/47nX
         yN+ej2ymuHx8rUj3AZbnp04UixYblvGB7KwWhnZbOo7jlPl2mxN/hel1XeOR6k0K8NCo
         /H9pL2mm4FVvAsAl6Yku3vvFiprD52AyYzIAvoF2/pWbIChJUqvYqfH9cQmXi29ylwsa
         2/GWroYrgGAGhaW6A0/e/anz1g2R3Wut09xsm108LzvRV35K0vvNcbfsUQsMPBG+duba
         Vazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774644240; x=1775249040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS7/E2sC1kaZB8E/dQAOcD4c7Mt+5yw7HMOSuN8HZGw=;
        b=UNjgluOb99stOKRvpzK+RUZnGuQBP3LDQ/01uraDEhR5lxK3iZJzz5MwHmlLvUV2Ei
         oxMCn8wKtijaR1g1hqUSlw1RCU7Z+oimedL1BdASO1Vs8oJ160+W9eCiUn6qXRHN3MRw
         lNCK1ya2pAHxS8virnWBCdjOtxLq44hVRD69iQepstYQY/eTxSlR9s/4uNlr79no7R+z
         DHsjUOriW979P1L58oGVROsBBqUtdPb4Qw/yhLn9+EZMmLMXfQvtqk9nwcosP9Kkv/ZQ
         35Hf3tmHi+SxO+uuU92NEpevBcSe8lI57+951iJw2y9i775naoXMKqNGzTmUuR1yBtXN
         5gXg==
X-Forwarded-Encrypted: i=1; AJvYcCWe86b7XRM22xMln1lDxHXLANgceQ3tUUdhmXXdiJDYLJgRhkG57OTYNqfK34FpQVLvoyDT7JwRlRYPTyh9@vger.kernel.org
X-Gm-Message-State: AOJu0YxWI3RifUWK/7Py30EMW5IWmLwUyOHpdL2v/exOfRh35BqMFVhy
	0CjYodGehEja/gXTBjG/b8qEvDNhTL6ijBPMAHNEYQHgROHVZZybH/wnzDp4DED0fV2aI/p+xyj
	KhI/gPhRZmDBf8GiT6Z4AfyZTkux9YUXYX1/g+L59lo4Yao1bRKpwbUWLdjiz52RUa7Ra
X-Gm-Gg: ATEYQzx7K05rMkdjItHT03n1Pw1MTZ5Wa4jl69oKTpRSD3c1oPj/V2dXncAtmQmjT91
	Tujz4FVhQbqfL2oGKflANawPVCGjxPG6DpsUw6DU54eAraOiVnTC1jehlnePdmyLBP7wqGkMTcL
	+O4CbuyawlyAGGy5g7/Xp6qTspk1N8zIWO98qcZi7rgze2FsuYP7a+vm0uhggU6qqLvXiLx5cz8
	5jMblKccBUOd+AsjYxwPjSXyKEqjY1qxuLBRcqe/lCGxEznQX68Eb33o/pnYuW3sKEEJBrvOBdS
	y/w6Zj8q6MvFIDysB9wf1zsoVqfFHPCLrV6DKWs42jv7DUgpyhCk1qrIQpeu78Vn5S2ZDLSdmJf
	d3493M/EH5rHPdXnuHucLM2zSC/+hEUroFUo98FUYS6TdQCtQdVvyb+LmQ7mwRsFo+WUsVxLhkM
	tNQVTFARBX/cfSbGt6IdpH/+FTw3arvM1DuGY=
X-Received: by 2002:a05:622a:1ba6:b0:50b:3e64:9b29 with SMTP id d75a77b69052e-50ba3818239mr54281751cf.14.1774644240424;
        Fri, 27 Mar 2026 13:44:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba6:b0:50b:3e64:9b29 with SMTP id d75a77b69052e-50ba3818239mr54281181cf.14.1774644239833;
        Fri, 27 Mar 2026 13:43:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd743sm14355e87.21.2026.03.27.13.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:43:58 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:43:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/9] media: iris: retrieve UBWC platform configuration
Message-ID: <zin7rmeaycp2ewrlc5sgwjomey3kspqknjbkij2g6ztnawukty@66vagyozrtxx>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-3-1ff30644ac81@oss.qualcomm.com>
 <56860faf-3f74-daeb-3d19-a35243172317@oss.qualcomm.com>
 <cshlsxb4fj6piuxadtxvxl5rgnl4aljqqrojl5wkp5oew5ynxy@ah3eo4aexe5n>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cshlsxb4fj6piuxadtxvxl5rgnl4aljqqrojl5wkp5oew5ynxy@ah3eo4aexe5n>
X-Proofpoint-GUID: Rsuf70DMb1sw9cqYV2P2WcqWbADuKclv
X-Proofpoint-ORIG-GUID: Rsuf70DMb1sw9cqYV2P2WcqWbADuKclv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0NSBTYWx0ZWRfX4/o3yfLBJK4f
 m1Dw76Ca+uCxeYmWMuw16gJsp95j6oKY5qv1lmvKrw5QaWTJsVfp+lF2pr8Eh7Jqu2ASF/yytem
 lL/fepDQdeabDgHHE5Q8oaOGeO8vmoK5HdLD5ih3AhQNl+SCJavRtFC230vIt2BZxBnntc0/0i3
 y6cKaFlmFWkW2K9vJuj4XxdWKyIiJkAKxjUqXDjXqxVmMRNX5GKh6XpuUK5XN9lWBPrI10oaVNV
 66ZloCYILAsfcjcy+BHdt/Yad/f4sKqpz8WfcZyK73MqyqlgefwT7hz7WafSd90H0b/CruYJUTl
 QX5of5brS6yD/3igDvYum01vmxvN7MHSIntbKYLnPOCzEwcIZl179O+DqunoLhsTO0sTn6JCQhX
 cFiVq50co5hTuB0PbX2URikc3KWWOmA9fwjEioWpuMgN+O5SOB+X+8kxSlLGmxuCoThsDRjsIzB
 qOmm63GUhTySIotZRZA==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c6ec11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=W6jageyznww4trKTX_sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270145
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100471-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B357034B363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:42:05PM +0200, Dmitry Baryshkov wrote:
> On Thu, Mar 26, 2026 at 10:36:05AM +0530, Dikshita Agarwal wrote:
> > 
> > 
> > On 1/25/2026 5:00 PM, Dmitry Baryshkov wrote:
> > > Specifying UBWC data in each driver doesn't scale and is prone to
> > > errors. Request UBWC data from the central database in preparation to
> > > using it through the rest of the driver.
> > > 
> > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/media/platform/qcom/iris/Kconfig      | 1 +
> > >  drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
> > >  drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
> > >  3 files changed, 10 insertions(+)
> > > 
> > > @@ -244,6 +245,10 @@ static int iris_probe(struct platform_device *pdev)
> > >  
> > >  	core->iris_platform_data = of_device_get_match_data(core->dev);
> > >  
> > > +	core->ubwc_cfg = qcom_ubwc_config_get_data();
> > > +	if (IS_ERR(core->ubwc_cfg))
> > > +		return PTR_ERR(core->ubwc_cfg);
> > 
> > Afterthought: This change assumes that the presence of a UBWC config
> > implies Iris UBWC support. However, some platforms (e.g. qcm2290) do have
> > UBWC data defined at the SoC level but do not support UBWC in the video
> > firmware, which could potentially surface during SYS_INIT if UBWC is
> > advertised unconditionally, so this might be worth double‑checking.
> 
> No, this change implies that the lack of the UBWC config is an error for
> modern platforms (which it is anyway).

And that's not to mention that Iris doesn't support Agatti / QCM2290,
nor any other UBWC-less platform at this point. Those platforms will
need additional chagnes anyway, so you might as well include a patch to
skip sending UBWC-related packets in iris_hfi_gen2_packet_sys_init().

-- 
With best wishes
Dmitry

