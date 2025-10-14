Return-Path: <linux-arm-msm+bounces-77121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EB7BD8640
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6EAE3A38E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE662DCF6B;
	Tue, 14 Oct 2025 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vju3B45/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A4285C99
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433558; cv=none; b=hQcyQ9M0Aj51NLCbB85n/m+1dX67b1ZCikOLpeewIrj1f2bpYT9f45siU313WzXr6Yb0atCKbUWm0avJ7HpzoJ0NUu98Sz4PBAzMqYnjFNMMdG33v+o9anBjIlDcEejo/3Y+8RD565gkQzFgeC8SLb9Yd7c0KDE4EREAK0lQKNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433558; c=relaxed/simple;
	bh=KCXqlj2/eMDCK2VlI2slSyknIFjdtmFTDQyXloiv5ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUIeiUNXDiXeFjNKm6YSJBzxsOZVvhe0fGYrDZCYSxbyBpnzP6uHnkAt/surZFQm4WF4DRmXhhIdUG/ySvbTizH98XD2DZNPutwd6rMBTclYUcJmgKEnjj/d93oL4hnB2wyttPY/pM/fRG8ryA2D6YQGn1nzVbT/DSaNgK46Gvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vju3B45/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Idf017771
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/M4+9qjbR0xmZ9AUGWwlamLg
	Bh7AibV8Qv6wfylCGO0=; b=Vju3B45/mSf52hBqT0GENjluUCDiOtbOR2hShHAR
	BcJk1V4XprO6TdfMxVoQMolPrcpWikbRccTF2XTe/aPr9dkq10/7H6n3b1n8X4NF
	fFkCyHEKD1v3gwT9UVs0LNGGqc/uySAoxA71KPKW80lOwiEJT6ydGQv4aOLGbbgA
	ideY2iQsyPOj9sDoQt4yZvoLWbLAEIl+or1dOB/8T2NVGhoNfeQLSDpOlEEQYhHs
	rcatz2WUT+eM9xAbkiJzlJNwXlwekkWTNvuCCoRwFLAaIFdIBCuPr5ntVPQ8Xb5a
	PCSfkuykNjcai38qTdQkegbwlpPr10Mj5xeSIHzRYWAkCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1ac7gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:19:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-86835654255so4723275485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760433555; x=1761038355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M4+9qjbR0xmZ9AUGWwlamLgBh7AibV8Qv6wfylCGO0=;
        b=BPUM8HztmmtUi8MPHkUr87tboSTxDdhN9H5/TGU6vRGQ0vPKDOMSt9lBQV0nNrXRbb
         ZGABpiUTLfDpP2hXsYLBtAiCDHDDlMqnI8zydW0jtL9QybsrOQzEVkwfNZouwaxKsbMH
         9itcQu2r5NMzyj8e4ulb8eGS44GuaVhTZmE5ISpogDG1D+sTebLVYTx3sPFG/5/4mlTm
         BzHlHsiYF08n8P3CO+7n4V6lBJ9suzUHNeezGDzVdvZK8S6m2bZeTf+VlkaxtgVcyrau
         MvhE0NbRU57oljbUf0dgnyouM17ICho2BwcoeUmoNlLjAHnBa7YgJX9H04QfYIRgcd9z
         ZVcA==
X-Gm-Message-State: AOJu0YxvMAieEOy4jSK8Y4jyvyn4vsTpB/tPd8ZWRugjA9k4Y5ofPTwP
	0LfUuypH6R2P168VTLpAYHNqjTgr3TQ6r+WOIGnXPfst/w2W2cvGz2UIKmg5lkICmr6DjPFh259
	KABrZZl++4yOJklXGl1qCrYA0XCtcweOjVOW8Tpw9zJKaWMUw+AH9uZbZyoHTiVj/2tb8
X-Gm-Gg: ASbGnctzomyV3BnAwhSU7zNDFSVirL7DOLqOzltslIrptHWo8P9uDCVlrtYhomC2rn7
	4b64bqY3quxhuG0x2ABO1SXL0P70ASu4bqMgFzRPZrByheNryv/If8p8he8pguOwBs3dPt4tS1Y
	kFEv3WSNROGUjCcEA4i1kwDq+s18UKaV7iQKT/VQZNHAnULqnljSd+5SiJJw2nx6DOAShEeINLJ
	2hZYs89DDSUIOtjkt4fRyMyxC3yLSmSplmeJPFALqXoTjebTumMtIlj78xqKeFzpqeQ6tzvI/Nt
	SaJLmGoxqePhuspl9WCUeDmZ5+PPzGERgiYQzx4sWSJ7BQ6iCvIh63xpscPGXXAV+wj4XdiPwDo
	TkrrWg3VYvbrH4Qh26lcFroe4KtYZShpOq32U5BdHcPHdbfnEYR3B
X-Received: by 2002:a05:620a:2a0b:b0:86f:b068:32c2 with SMTP id af79cd13be357-88352ba768amr3441610985a.65.1760433555032;
        Tue, 14 Oct 2025 02:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ0Bdv9ZRjNQZJ2bun3sNcAh/K42pzla7s+n3DhqMnWjW0vg5zZPO+f31pSNhVt7Buy9t+Hg==
X-Received: by 2002:a05:620a:2a0b:b0:86f:b068:32c2 with SMTP id af79cd13be357-88352ba768amr3441607285a.65.1760433554567;
        Tue, 14 Oct 2025 02:19:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea11d19sm39716781fa.37.2025.10.14.02.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 02:19:13 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:19:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
Message-ID: <v6cvbds3fsbf7ebfi33mpkrgbrrb4oxubgpshzjn4o75j2jzcn@nnaenoukfu2n>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-7-quic_amakhija@quicinc.com>
 <fsqytqhe72bgmloyzm6khoprq6bysf52ufz6oi6epos7uadyho@wg4rxs6f2xyl>
 <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee1594 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KBoXMGrBdGQ6yHO1rqoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5FyNj4pqzSYE75bC-KKwZc3AFj7Y_nyB
X-Proofpoint-ORIG-GUID: 5FyNj4pqzSYE75bC-KKwZc3AFj7Y_nyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX7RYfEhdchACM
 kgc0BtNvoF16kMXv+KDShu0FQ4iGT9SzSm3zPhCVEjuC407ON49pnyHQ8h517RLmaXpTchzCPFS
 7sB630S+Bx+uH3vq+dVjTJff0WQMtYLtkzLIACwTrUMMlJRi3dSK7wLjHiL5cccrfM8jdaKeUpF
 az2Q+euoyqLJSVD5ueW5zxHNvmcJrQW0nfBosQLCzPPlzY21Bq16Pa9JBgTOq6zZ4HyvooT+Bb4
 zvPkS223NAbaB4AitOh9yl/eujbXbdMrzkjgrbKadurkABsuTsNqFDMEJwzTzkkZnsUGFm5yak1
 lhSLl/WXX75AYLM+DuOFAk/GM4ICQ0sx1t7KyziEqmOR1IYMGNsdpgA9gg7w2u4JptigTY5aRi0
 zsgSTFz+yStTKkKCnNKwsf18JcIWwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On Tue, Oct 14, 2025 at 11:54:31AM +0530, Ayushi Makhija wrote:
> On 10/6/2025 3:44 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 07:09:23AM +0530, Ayushi Makhija wrote:
> >> Add device tree nodes for the DSI0 controller with their corresponding
> >> PHY found on Qualcomm QCS8300 SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 98 ++++++++++++++++++++++++++-
> >>  1 file changed, 97 insertions(+), 1 deletion(-)
> >>
> >> +
> >> +				mdss_dsi_opp_table: opp-table {
> >> +					compatible = "operating-points-v2";
> >> +
> >> +					opp-358000000 {
> >> +						opp-hz = /bits/ 64 <358000000>;
> >> +						required-opps = <&rpmhpd_opp_svs_l1>;
> >> +					};
> > 
> > Does it really support only a single freq?
> > 
> 
> Hi Dmitry, yes it support only single opp frequency, I got this information from ipcat sw for monaco, similar
> we have used for LeMans.
> 

Thanks for the confirmation.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

