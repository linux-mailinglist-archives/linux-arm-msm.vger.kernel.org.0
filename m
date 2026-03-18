Return-Path: <linux-arm-msm+bounces-98527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHEnCufCumkGbgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:21:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB322BE16C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6493D3223753
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DDA3EBF03;
	Wed, 18 Mar 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDv+zGyf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdOuw30q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B72C3E0C46
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846562; cv=none; b=onSIKmPzwi4ZcwGTldom2VQgIfWydhEJjGngE/VUaVaX1Ltl2GHY7HkitMGVqAxywHOa2T8kkyT9Ae0ungrN2BR1ET/UQ9FwhDGuYo6cDQ84TDmfs6xh6PBpTfV52SZ56zMYEL/NX6LK6s6uW4yYWsSpVwWPwJ7nbsNxTr7WH/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846562; c=relaxed/simple;
	bh=8h8t6L7UJjnnHh7DNAu+XCYzbbspRqmakJ0a75DIRUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upSFBDAQt6ytWEzAvjLpOK2m2fdmnT499auD/joU8KZ1n3en7raARIRxDeHz8HVm0lm1Mobc6ViCt7BKrg0O/iiUC92DjQspR7ZMyHk5WPMVtLYaRMozZENRoVbjZZ8AqHk4J5eJQ8nEKesmrkZ52bA3eaWogKogeGqocW79fig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDv+zGyf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdOuw30q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IDtM462789960
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Cn9ilx/3avZr+kRHosYvMle
	e1f782wzMh3Ai7wZ5uE=; b=eDv+zGyfQIybJnDMGPzj/6Ur29oA61LabHaC3hN4
	I0odNdjX7L6xUSgiiq69ZyqtmofBZxaBjHwR81WMuY5x65Vely3egTzdm8K3K5SR
	p8Q/+zZEyINItmriILocmPsSA3ZuSAYeC4wsga6tNNiQ2OVR5Eu+0FotzHrXK18A
	fcajoAq4ffox+XdGQPLOLFu2+BEjiJ/W0KKNDicXeb7xdyZTx3iaPW1bm2QNy0sq
	InSFGmjg5imq/vHk+xl7F5Uedn42/EkhRFI1iBWYzq+lez7oMoXzhcw5D4vilW8p
	bpQTIz+B/4dK2KL6sweyce0blRRrrZ2Lf9xTHqgv3eC3ng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g33sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:09:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090cc6a7d2so102994271cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773846559; x=1774451359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Cn9ilx/3avZr+kRHosYvMlee1f782wzMh3Ai7wZ5uE=;
        b=AdOuw30qkouaY9Gx/6qC0WUY0KhiJEq2E1NANyrXFqj4VJovR92hTvmTdlatWopu/6
         BH/T5C2Jb3XzxEoYl49CTIZ2vv38TlGGBsU4PaBxZlZd+fdvrL1xvKbCJ2G3HHNKqfPP
         Y0H7vsD/QyULzllHIAU9EzEhif7N9zaQOP611UHhupIvGsapGfswLI//wnN79/P9zJCb
         Y+e1Aq6cav8c5iSFZHOyB2EhWG8mDVk/ZpMzbHaVOOvD4psdp/4zDBSV3AKPNYcYPkGH
         AoH8CoRPp3RBEaToYApT2mlehNP2YwS97Hi2EPddtUGxtB519L7Nm+VP/9tkM7a7MO2+
         zTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846559; x=1774451359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Cn9ilx/3avZr+kRHosYvMlee1f782wzMh3Ai7wZ5uE=;
        b=L6VGHBtXsiITHT78M3PP9xTo30FcsT0ZpmYspVy+cRcNkGvNE5n0lZX6i0iGhbusVd
         WnJejVqQ7d2EZCtBeucJs+DJfrPS7uQ1dypTEz+MnAy2MDsHe9iQ6d00YEcg38WUPkiJ
         rCULFXQxYjKN8HIfHA0X+310GrYWWIRFuP9UoyrL1+Ur9/4977Dk4nPoKBr+QWWrp6Q1
         uJyxZVaTouNpOB937QDS2dZtum03AKUwLSMIXAEG6BqBSE3ixhHT2MaNTCiqDRMFxgzn
         /Q/y2A2WPRRwLK81LTuNJY2rG7aOiPNyXT+WfCJnX5egrxpO1EPHilw6ISC7w3JKVGit
         J6/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYVKq6rAywR9KTFKpefI29YjY+nlmoceVymgxKD/f+oRePyIwJQb2gAQ3y8wGOx46V8PGjroDg2WB79W89@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4CgjSW/RMPuL+5dq+rrmwdiVHUKlfRkFQ1GzhXeE53g3vRzNv
	smNNcIQlR7FHoT8h0SPMxypxQXzMRIcL5jIPMJSX4Y8CLm5DPyRW7kaPnkZuShSOr2pH8tNcdL4
	Lc/dQeGqiTq2aKpHTvmeKcqnuXiNVPdF8SYPDEnCUmpTJ3xxl8PBjlNz8VhpbEm/kNTVo3lbDz7
	nX
X-Gm-Gg: ATEYQzzaDHCo3ataPBoNeoJsQuu+TSzCWyLLay4j5Q5D9Svy8fNl/QsmAOMbDBFy2Nj
	/zTBa570bkKBx+bYgHN2FRVXD9qqABjiMzXr5A/PKrssJso7Ne1YqXVE3AEf78GcrlZSYvh7ime
	KNapM4ZHmrkSv6yVPRi+mXy3MKCypbbZzM11y3EbYNZ/HqRmhDFV9OqOGM+yyNZ4yHyyBiraTV7
	VR1FBsB+rSNww52uJsiUmfShV0JdHR/tQHNKUqhtZsfnWgG4CewkOTotO9YUuLqkGqCXSgV4S4n
	ZZaq0NVEN1TUgiN4W8FTpoqpKM3ZXkzf52HZizE4pkQL0VB953nhkS3KWCqJtRgpyEZ6H+lP4Ce
	+/4UZ4vyJuhptiWz5gR1LnOfctUHxWjplS5K3nkP676iZwaKL1twRoPboPIjTPSaYpUF+ibOW2E
	dCAoPKXDEJhWCS6jHz16ELUmwOgh9jR+nRvcU=
X-Received: by 2002:a05:622a:34a:b0:509:2d8e:3eda with SMTP id d75a77b69052e-50b148818damr45454911cf.45.1773846558901;
        Wed, 18 Mar 2026 08:09:18 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:509:2d8e:3eda with SMTP id d75a77b69052e-50b148818damr45454361cf.45.1773846558375;
        Wed, 18 Mar 2026 08:09:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c27351sm609135e87.15.2026.03.18.08.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:09:17 -0700 (PDT)
Date: Wed, 18 Mar 2026 17:09:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
Message-ID: <gekcz3b2o37z44h4xlzr2eo7ytewhtgtoyt3ifmizyhcl52sn5@xmowdspldxhq>
References: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
 <taqh3ipe54cgjwcvyqnysg7dx56mweo7zld3jvmv6goq2vo4b4@ea7ksdyyn3dh>
 <sotoyaogawzdlazsbuubwdj7cuoolortj2lzxgs2reew76gkpj@vyts66j4hg2l>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sotoyaogawzdlazsbuubwdj7cuoolortj2lzxgs2reew76gkpj@vyts66j4hg2l>
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69bac020 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=nuaZ5ZqmnFVoJGL9zekA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: o5_oBU8nLCi5D6UiSJORcbHCJGCIa8zR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyOSBTYWx0ZWRfX/211XecfwlCK
 5ZmzUcqGO5+dd+b4NniWWQtM47GolAW/otAxW3Ql00BdX9zW6lwl5DS+IUPac18EAYiQca4H4Zm
 LpPD9tUVXFwGk6rZXYSbspqVbGcFk5iaqgpe2jexoe0mdVWh+653p37Sd8qasjhpow7RivVqOE+
 tdiSayGGOENokffic/kM0EUoaW1U5xPeH33f8UYxHCwNjdpOvin36YNlQrPHZ39XcXoV7CGjHQo
 TYwepuS5zLSGAM69vAmM3L/Ak8JrZhxvwjKOAOyLIiMPMMEFXGiOfho7K/5Ih1gAHqKhGcDUFHX
 CBax8RS3BH+TYfmot6axwBmZlnaF+1hAf/+u1T9mLZz9ppxDA2mMxBrcyUfed6EfeF27q2QSt8g
 O+oZZkA0EOujUHgl5I2jl6+Aa2vmeTSsvNXIWOq8d9U++Qde2ZRF4DLAOyLEtOVAzbJukfwK6+k
 F5oBTx2fKno5Oo+Omrw==
X-Proofpoint-GUID: o5_oBU8nLCi5D6UiSJORcbHCJGCIa8zR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180129
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
	TAGGED_FROM(0.00)[bounces-98527-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FB322BE16C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 04:22:59PM +0200, Abel Vesa wrote:
> On 26-03-09 21:52:01, Dmitry Baryshkov wrote:
> > On Mon, Mar 09, 2026 at 04:44:45PM +0200, Abel Vesa wrote:
> > > According to internal documentation, the corners specific for each rate
> > > from the DP link clock are:
> > >  - LOWSVS_D1 -> 19.2 MHz
> > >  - LOWSVS    -> 270 MHz
> > >  - SVS       -> 540 MHz (594 MHz in case of DP3)
> > >  - SVS_L1    -> 594 MHz
> > >  - NOM       -> 810 MHz
> > >  - NOM_L1    -> 810 MHz
> > >  - TURBO     -> 810 MHz
> > > 
> > > So fix all tables for each of the four controllers according to the
> > > documentation.
> > > 
> > > The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
> > > for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
> > > in that case.
> > 
> > The list of issues isn't limited to Hamoa. As we started to look at it,
> > could you please also fix Lemans (drop 160, 270, use 594 instead of
> > 540, use single OPP table), Monaco (the same), SAR2130P (leave just 270
> > and 810), sc7180 (270 at low_svs, drop 160), etc.
> 
> For now, I'll just do Hamoa as this is the only one out of the ones you
> mentioned here for which I have access to documentation (yet).
> 
> I have prepared patches for all the other ones, but I need to double
> check the documentation, after I get access.

Sure, thanks!

Please ping me if there are any questions or delays, we can check the
docs together.

-- 
With best wishes
Dmitry

