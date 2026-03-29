Return-Path: <linux-arm-msm+bounces-100621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lUB4OfNNyWmqxQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:06:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ECF352C90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A903E3004F29
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 16:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C831537FF44;
	Sun, 29 Mar 2026 16:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJioA11N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OG9b/TfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D6137F756
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800366; cv=none; b=XWeQyinWnCqpesdSb+LnMaofYzs2bD8fVj9/iLgYLgnaruzdEetNNmx4x6x84OyZS/F1P6gdPN/VT3rHZpLkITUf/1pm9fe6i/+3i3qhn/9npx5dlxHhv6HZQWuZYj/6DxbxgFsolWyPH5APNeHUVdPZwLoe308ryT9nhc29tL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800366; c=relaxed/simple;
	bh=Wwe2bhibkSBJWH65bJq2OBBqLcUCNgCyphGaSLdh9H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNVzJVKImTeIQSGG0Hx/Mu6riDBflbkW89J4dWH9WR8oQ2UN6hZJr9gLgJ1FzqL3MstIeiHTocI+dhgkqbA1Zs91Wk14mPXw7mwE7S5X1mR+rC4fnTDmNqKUCOrMpShJg0XYXzcai5oq7Gt7VIrCYBhQQNsRmm0sGO+Ut0dfLeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJioA11N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OG9b/TfE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TCVXB2110123
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6a7xGIW+v7su/rHPH4IwJYil
	91h7hViXWx6i38aywTQ=; b=IJioA11N3bt3gVfAXhRSWSHZKrupWiI00yCJ/752
	xsZP9xhPCm54Z2V/mXSAN7PFZ/Liq0xkd0qdnrA/DBiQsfvyn6t2k87CoV4oP9Nh
	kfSf0A2TzLuLZHstPjuNcCypEp9o1+IU2w5YSqke/AUQCvmnE0g5/Ckbf5T8n9zx
	mpR5DPTDGQIcTGrQQ9X8eqXGOAazitDWcISDvASoZFZYYSxa1vIOg639o+21hiPn
	QdXBFPexO0IBxgVeplR/BcI8X4mqyjZiSEx9IJ1x77IhPTqeWlTQOe/JsncZFskM
	b/HxUHkSFv+I3cLzO+nCFB4fOSdLHos7v00JQ+DlCFPdkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d677134n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:06:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509219f94b0so68868911cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774800364; x=1775405164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6a7xGIW+v7su/rHPH4IwJYil91h7hViXWx6i38aywTQ=;
        b=OG9b/TfEF7V7hapoX67KqkYvR0pE9t3+E/BTBqXRh8njiVo8CDZO+O/iJeCUC1BxCm
         1Sna5u4gNvZPo/Gdhd1WkBlc9ZQm2GD2oUUep7zPOylEzBemj1rjfbjEQcPIQ18t816d
         SPOTmN24vY/5mdVbXHDOI2gHTiqHYatxsbEEyQJNVihRSBLs6RD1QkSnJ+SFFFm/b4+o
         EvdPxSaAAhZItvrCSA+HuubFYckkhOhrH1p65aYPRkUWZDH1boBEA08/PhubQYyRj8bz
         lUmKL115M+A7CrY7cMOKumOn8mHCvhySaqXjs6zVNTRjuDQmmawTAmAdBJewOCo7X4L4
         SG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800364; x=1775405164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6a7xGIW+v7su/rHPH4IwJYil91h7hViXWx6i38aywTQ=;
        b=aeTwYxa/0zmaLGl1CnaG+5hCYrgyk+M320z7wDpflCTkGY/3cBzAKA4+CiJ0YZXUNh
         m4uDp9CQiJ3vIACcPz5efFox3orFsBNj2omwJ4/6fs0XCPCE+FvmkVbNl/5hUC1MqDIk
         Ks617xCsoAeF5pqSbZhh578skg7l1FZzg31qieNVcVZCI8oJ3LjTMhSYCLvdTggM9e72
         CvrK/g1ol/qoUpenhvBgimxMEFOUJI18mNfBZCWJxejtzmKiltIL/6PWH5Ds0bpIcxmc
         K5mBs64I+CQuMFDrvL4yZ+JAn4kayXgVjcKskwmz2o51lLfpOHQ1BY9eWtVtjpONQaJt
         49bg==
X-Forwarded-Encrypted: i=1; AJvYcCXNO6bT/q8B/4ba4speOdeszTTK81Ize8LVzNMBw4RSx/h0zGUmFCcY51e8RPpBGj8Agac6cBxpLz0SLwPt@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbgoVbAmjeAEdREiQmyeF8Nw96Bs11kBUdtJ89AMfXoSBQ5lq
	ymvny12bzeWylNwyVD7WudW2aSBNHV65RiPSmRMmEHcZOj57We89S4Cy2Hsk/HsiJueKDQNh8dH
	VIInXVfd8PPIWnbjr6AoZtuD/SYFzulu0JMHMefNZVXigCa9DTAXa6DWNy5Uld/qKnDrgYzkQ9A
	a6
X-Gm-Gg: ATEYQzx6IpB0xTq1pH0FdR8AmkcIXxYyFKmmVkk1mBr4XvKX9MDh8r0abMhPYyjRwXe
	YdUj6QwthQR4CActvFx/6KAK/mJYdU634ZVjTGPO7SaCSZEBAe7Y9e7qtknD9z1Iv/M/KRqE9mz
	HLYTANaigoxrdevWue46x0hzOxG8fY6ME4HshvoclK27pVjJnkojdy0YkwJ2JUwNu+uL3MxLi+c
	t0RkBhd+Wj2tf6X9tw/f/TegNROWHgcl+QuiVopV5q3f9fKUFWMBcT9BNo/VwbizpKipQ0w4HF5
	H1lBYiKSnZVOGhes6MGM+qPxoPDpm0ue8xRIQMinH1O2NlEqsf+IbEsXcEmgrig9S9CVqPpyK5C
	f2zF4Kfifsy38j5KzNuky+Ho4hc9fDhSLMwZsjo8hvjjUVOsgGTJTn9+1gyglObgOHeTL6Z+iCh
	//epeHl/N3hiKkDZ+BoUFzUlqH+SmaWSBvjIg=
X-Received: by 2002:a05:622a:908:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50ba391864bmr153157191cf.56.1774800363812;
        Sun, 29 Mar 2026 09:06:03 -0700 (PDT)
X-Received: by 2002:a05:622a:908:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50ba391864bmr153156571cf.56.1774800363385;
        Sun, 29 Mar 2026 09:06:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444a04sm1115976e87.48.2026.03.29.09.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:06:02 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:06:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: fix indentation in sdhc2 node
Message-ID: <5xkirxih3u2nm4kzeyiudisa2vmz7ujworo2rciyuynjp2npqt@cll4ysv3nhkh>
References: <20260329-wip-obbardc-msm8996-whitespace-v1-1-ba3a278f043c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-wip-obbardc-msm8996-whitespace-v1-1-ba3a278f043c@linaro.org>
X-Proofpoint-GUID: NTAkAO3_z-V9-OQCtQEIybai1-Bnetn0
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69c94ded cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ohd0kZHHd8clEy_HuuIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NTAkAO3_z-V9-OQCtQEIybai1-Bnetn0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyNSBTYWx0ZWRfXxJA1bmO3frsT
 PfSkPqhPtbVsq7CrnsR1lpQI+DPfg5HZ7+8xPOalfEpE37qHqa95wWDJnUTH2By7qsymHteJ/1N
 uzX5whuvH6rvb9b/d/ZxVnI41GSlMkmERlZ/QqhfMvnmb8/IyC+WhENuRUI1QNgzwdWbB/G27EM
 NAVjlcktMGAmyG4v4d/Uh0Lhy2zoZ8pYPCxSh/S/f46zBYT4E6HEhtgth7DDEUWN1C1YVRS/Pm7
 APexmlLII54Qp3sonrn9l0txk4ACwOUEElumLgz3Z7qr3YNyV/ZgnzGhYHwvL/m+GQQjztXa8lk
 XHLoHD8TY6TUzMuyBg737nOWgA9inoK4pJVJNH0ZgIBBXmqQaaHKF2qwrkHVhRxBiadSg57H51u
 3RK5PcUmFnb0Xc9VtthEHS2e8P6wYLsPfPPrWERlXae+eBwtLJDXNAoaZWvBVL+bjRjxAG8/Eds
 b6lsH1/xvN3SqdXneCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290125
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100621-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80ECF352C90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 02:12:26PM +0100, Christopher Obbard wrote:
> Drop stray leading whitespace from sdhc2 node.
> 
> No functional change.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

