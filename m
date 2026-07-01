Return-Path: <linux-arm-msm+bounces-115723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gqpmAnIbRWp07AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:51:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 700C56EE5C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:51:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=maUGJmTP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cTdHP2wS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115723-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115723-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4625B302A70E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A9F260565;
	Wed,  1 Jul 2026 13:50:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E586223328
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:50:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913804; cv=none; b=AP3y9bkIA4zVIaoHqNPQirWJzVI94Qj1rKt5XuUESiZPh7KRYbAVwEcF+EtrUxISqLXrrs9eqaNkGGqkWhy/BLM9apwhZtAaO3emzwFNQe+x6tfqq2ukFufSlmPM7WItrFQbuiV9Us0fOXhoNX5u/WX1RraWiCP4/mwu47rPZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913804; c=relaxed/simple;
	bh=acgn6OY70PK+qOnh+hja4mnXsBwLNuTNt6VOTalVy80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW2Rd/h7YI1wVQKU7TWbCdINssqZSHdLZtX0J68qI1LzzJCm6sr0F0deGhYqWKtqkrkT9dqEyJ893ssBZSACWfqCjxrSqTtmBY+cxMdBEr9EGoHdsn3Kt42eP4md6EE9ZYqhBpnvzs0B4rL5/hI3Umtwr/sLQY6o8X7msfYMG7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maUGJmTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTdHP2wS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8UtH672922
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LvOIcF50K+uIfBJyPv/IJnwM
	Hx6DqiGFCP+s763et0s=; b=maUGJmTPZpvMmksY7ngZPTuq8RVPf6nZ/zNeiZUk
	z2k5EhjfGaGOp3Ouz7kJx25B5wHJ5eZ+MZ+cB5fdpBuWBWNPySKBm/Pqx/ock9Xs
	SEQbZsgdmKFrCCDILIRiy6tOe6RQqZjsIDbIYWW6zWaz9T0V1NZk4hRfVa+rTpUQ
	9TzyFGdJ4Ql6mIxmIRL7OLnGZlsmsZAxohpOhihUe7jZ/k2I6KTdTe4C37mHJnwP
	X2IlIll/7ryIAMVYfklDNo04aevopsjmpbpu5OKCk7mVDfpdUKPzzu73NzE27tIX
	vRPlauj/Pv3UWWFdgCOs1fB4VNVF2C0BZkKf87MfNpT6ig==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502us4rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:50:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6798c46f723so331560137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782913802; x=1783518602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LvOIcF50K+uIfBJyPv/IJnwMHx6DqiGFCP+s763et0s=;
        b=cTdHP2wSALOEerkBE1X2YwVApoWBBRx2LnoXvdVUYcyXF401fDWQYhqZx6j3LCGsh9
         WyWH6htYcf0tDtJzsdItGNDDMpEjO+3meySjPE5q4Qm4z9l616RzK+OVTSi2ta/Xo04V
         +xD5QN4+HPw9pIHA4KPRAk3dR1rH0kICNcTBHhAEzlnE/5UEp+GQOh8TbEzLsP4FmkwP
         ZWJRyDcMrvhSqnjARoSGm0IzLmTR6veNjHPc/cIqzh62q5di1wo38gdI7usL+MAR5d+E
         VGCJDg/pksuAIFlQBoH9JSLfuhyvanWxdGLjb61O9QAMHpH2AU8cRZ5r69Rf2R3UCJ/X
         oIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913802; x=1783518602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvOIcF50K+uIfBJyPv/IJnwMHx6DqiGFCP+s763et0s=;
        b=XpcHtFSB/FHSgrDmHDg+ye1gFg/tdF3HI2w9tqrrHfW751iPRKpJuP+9AFULgBAbyi
         ql3rHdyTW8OYjex1yGiWDQd87uB7bSbjs0VC3WRo6/JGgDg00thSunQ5yMXCphfkohiC
         pH7zd/5LqOhZGc2uwNhCZ7EYZ9GzDv06DuEq6h9SQyqMNRZGpTa9k/xXja6UA2Q9Dxvu
         Xqt/4P7i/w4Ox6+mD5aEhrV8bI94+5ooI1+gqwKWJR99eY5902hBlPGNS8eHJn/M9qPN
         C6XLcKfO4U+MvbkClUaThSTiox1Mm7477p3xrL2ewwcfPEL4BnrjpAgH872+RYpoMCEv
         Zp8w==
X-Forwarded-Encrypted: i=1; AHgh+Rp+OMPv8ZUe637IHn1gNGJloP33d0HJoOx7r9vD6WIfLqw6GKXQJhtY0Sg90/wZgeiYTn8XO53hqGi4ZPf5@vger.kernel.org
X-Gm-Message-State: AOJu0YwfkR2acXPv3LgsRWde/sAc4tygbD+09t06QUcVMgtEDF3+Poyy
	cXAVS35fbnnKGcHE5UsTGoBP2b4Q46fV70HWto6gF2obs5RWoemCNc1wumS4w2xyigkpmdTOHbF
	GX2F+LMYmkAL5eaja06yfssPYEQHvgi6QJ5Uqt4ZA8SFwQsqNB4covR96rHg4tcKwR+PO
X-Gm-Gg: AfdE7cm891UQ7MTW4djZEGm7d1k5whlwi68RAU80nH68zloPsHu95qrmNWyozPRuCxn
	VgnGmvILbBZbNNzcRTXZgSYgFOvPwqOrEAk0HOuE6o1d+SlWHKvTjukayAUX51O5aqUYFhGzLRU
	BcJXQdm+w6ICcHMNxfdGFGCqWReQtevspfE96uTUUAhobBk7SAlic4gddupVFvDrQ0vJZI7jyqJ
	FkrsUer/6BxvTUt/47t5T5Ev1rQKdjT19oPovThoideIo1dQZoKXNFqMBB0Ryuij0wVLp3ZtTXk
	qCnXno7kVu3Frvl6cJFjHXEzPj1aRJ5xEZaibY/Tn8d6hg+IJgdFqkjFdzMDXtocDo/oEnbUzNZ
	8fhZP1C0+pCOjzMfiUMt22AI7UU5HZeN7Z+sm5PlsmO2VkB8cBouU8VCLUhY17uqjzjNGZTY/Ve
	Yk+NM6znTJlFunVH8bH3FKDU2H
X-Received: by 2002:a05:6102:f87:b0:738:ff1b:942 with SMTP id ada2fe7eead31-73daa9bb6c7mr586063137.22.1782913801342;
        Wed, 01 Jul 2026 06:50:01 -0700 (PDT)
X-Received: by 2002:a05:6102:f87:b0:738:ff1b:942 with SMTP id ada2fe7eead31-73daa9bb6c7mr586044137.22.1782913800877;
        Wed, 01 Jul 2026 06:50:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe49855fsm1248078e87.44.2026.07.01.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:49:59 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:49:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size calculations
 for AR50LT
Message-ID: <jzqblo74y775tml2zwj6lfwcij635wkjivegfccx7peg4m6gne@cgu2leollht3>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
 <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX+rw0ObG7uIF8
 BvqfwyzpYI8+QQgX/FdAXImvkMqqZ2Ww+i+JS1pPQpMtQJyjL7L2uKIBCa/qZqnb6R/wYp6BUer
 U5gBSjNuEMMCLkB1wVIoDHzZvDUN28g=
X-Proofpoint-GUID: Z_S7AuIIpegvwhnA3th2LvytG1vKyD6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX+0UGt/Sbzg3p
 3F6Xs1Ukuaseu3762V1Qb+8JTe1s3BjIy+roDLOIOES6Hi9qSRUH0zCoO0JlLcS77ANUX1g3KPu
 /oe9WndBG0abiEQgRP7SRVySxMak8Tml+shRpLtfKLHTxnfT+lRdhTW6aXSuZFycB0gIBn0m079
 H2orjzDp7tHUZ3XuSVrEnDV4uNB2rFabwFejFg6IrmzL1nmWS8LSrxhAaN/ooIiU4JVysY30wBx
 IWJxAUpa15ruWfQP53pgADVb5FXVTCnjtFPohPE8x47BvVaYVmlNmjsG+5GCagFrnBz/M/DfPJQ
 pWefdh0OwB5USJWg+6vJOsSuxSnGONBaO+itI2vPosXIOzeMNSHkMk/nKyVFk2pkosrCdW76lTT
 AE7hWST9vNgpSobPBSgC8UPkGUcbh1bl4kieiYgSEpBSqgUUOw8mLQJzynGjL39o+p2wy7atYzY
 dG/Ta4i23U7TdEhFzQQ==
X-Proofpoint-ORIG-GUID: Z_S7AuIIpegvwhnA3th2LvytG1vKyD6u
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a451b0a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DNt0h2T3mK1VvZeRrVoA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115723-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 700C56EE5C0

On Wed, Jun 24, 2026 at 08:40:02PM +0530, Vikash Garodia wrote:
> 
> 
> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> > From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > 
> > Introduces AR50LT  buffer size calculation for both encoder and
> > decoder. Reuse the buffer size calculation which are common, while
> > adding the AR50LT specific ones separately.
> > 
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 401 +++++++++++++++++++++
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 ++
> >   2 files changed, 438 insertions(+)
> > 
> > @@ -507,6 +734,13 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
> >   	return _lb_size + vpss_lb_size + 4096;
> >   }
> > +static inline
> > +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
> > +				bool is_opb, u32 num_vpp_pipes)
> > +{
> > +	return hfi_ar50lt_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
> 
> pls keep same name across like "hfi_buffer_line_vp9d_ar50lt" and
> "hfi_ar50lt_vp9d_lb_size" or combine these 2 apis, as the one just calls the
> other.

I think, Sashiko pointout a different issue here. Should I be calling
size_vpss_lb() to take is_opb into account?

> 
> > +}
> > +
> >   static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
> >   				 bool is_opb, u32 num_vpp_pipes)
> >   {

-- 
With best wishes
Dmitry

