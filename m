Return-Path: <linux-arm-msm+bounces-96986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJu6McJpsWnsugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:10:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 851632642EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C17130330E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A792E5B2A;
	Wed, 11 Mar 2026 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="omee5eXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDA5234984;
	Wed, 11 Mar 2026 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234510; cv=none; b=oCG2kmoLSb6UmalGImWfmHKD+/ythcO6x416ZOHYLgPXwiQCmBT6UnywxAzhiulL7jmdOlLMFR2aipuKAqbvwu1U5CARpF/Ed3E2m6iFGXLfrSZHVW2/NyY77Qw/8tkEl++FvVjD23Xbjgm/Y4dHHhargrxh/5vT2x9/EFiIxcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234510; c=relaxed/simple;
	bh=GExLViuiNhKG3d/XzmtHkDmz2j9n5AVrBfgozIFoySo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Dqi1k5PUCfLkyoZilA8qTi/BS24QPZDDabu3MRBsaySx+4HyDEzgDO3dVfVtCIaN5kEwI6Mvtx0Ul0CyQbhywH7IWsef34IgUWbo574rT3D5IGz30TOe1VV3HbR+xMsLZWDz53HiBVHOpl3JWeOZubnMik4RhinOyNrvCTJxnAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=omee5eXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7rGp3508387;
	Wed, 11 Mar 2026 13:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVGaCo41MeMm86IlmDKWtvVMuJbDm+sybeCQJMvREl8=; b=omee5eXHL3bqa0Vr
	AdodkIWgfZs7TEmrnWjtNQd1r8TlxzZPfQ0nEqsad3X3S0biMzjaU6kJ7SM+vuom
	HhL9Xn+gtULPEWbGxWiusQc4q8FODr1nCFFnt5DNYEUrfVtlmPdxQzJTwaNrrIl7
	RIwVuM6hI66PENXEU5fbTy6naZWXZR4w1A1US+G6vMWfgbbtr5Dm5Lhtcqo6f4FG
	l9232NIUGF689EW2iqoMmy82JUMztdB3ZebBlcs3B6R3rqqUwXCRPTpOjdBWgJ24
	qT0NFOGKhFDIWEsKoI2MNYU82P7CssIqihP0My9Iag0oOI6+J5RuzTw39EViu4wD
	zrI9uw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppaky58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 13:08:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 62BD864Q027549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 13:08:06 GMT
Received: from [10.206.96.75] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 06:07:58 -0700
Message-ID: <c77ff64f-57d1-4495-bfbd-986644aad71d@quicinc.com>
Date: Wed, 11 Mar 2026 18:37:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom-edp: Add reference clock
 for sa8775p eDP PHY
To: Bjorn Andersson <andersson@kernel.org>
CC: <robin.clark@oss.qualcomm.com>, <lumag@kernel.org>,
        <abhinav.kumar@linux.dev>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <quic_mahap@quicinc.com>,
        <konradybcio@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <vkoul@kernel.org>, <kishon@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-phy@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <quic_vproddut@quicinc.com>
References: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
 <20260128114853.2543416-2-quic_riteshk@quicinc.com>
 <gurq34svc5p52bqx5qwkgjmschzcbklmssjzmu2tg5wzgppkft@c6nrw2ageyp2>
Content-Language: en-US
From: Ritesh Kumar <quic_riteshk@quicinc.com>
In-Reply-To: <gurq34svc5p52bqx5qwkgjmschzcbklmssjzmu2tg5wzgppkft@c6nrw2ageyp2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LlqxStZftElOeGRI7Q_3zF3zBylYvGNK
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b16937 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=lUy33LfxTXVzPkcjGfwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMSBTYWx0ZWRfX74jiAQkS5Xzd
 zgJFa322TrqMlPjsbfehslW4bFSJKt9DmP3GoKoNouj7jANCp57NNZaNPpcmx4uQSY63XwxvO1F
 jVt44SEVTmW53Mq7V+1RCqDXV3OnF9mfsJ0dt8QcfKnOei4d+4kLGR5lT2oSUDkntpdM/A/3DMG
 13kt28Vk8N2D+WrHZMbyQgSzrrDkeRajdaeWbJnHLDqOGz29lffHupGIzhydhOq0a+h1/AlpqZh
 J9My/r7lVCQAPEPAPLo6y8LC6osCqejgzLYZ2HsB86kidNaJyTUck8tmsV4otaxyRDaZwtG0eQ2
 CjSOKJSwSO504q+E2A+M7ETrLKhA6LhS1/2/dch5W1LgtfciEa2BqNkHbf3u/fiWEcKeAqEYyJ3
 8GHPA63/i+JFn6ZrCQjhdUqOGyUlqG6XUwQaS17d2BcARlelPDEwiKsZiuEYQsTvDae7bGb7bIE
 gPX0LzCQNpu65cpY5rA==
X-Proofpoint-ORIG-GUID: LlqxStZftElOeGRI7Q_3zF3zBylYvGNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110111
X-Rspamd-Queue-Id: 851632642EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96986-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,quicinc.com,hansenpartnership.com,oracle.com,chromium.org,lists.infradead.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:dkim,quicinc.com:email,quicinc.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_riteshk@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/5/2026 12:27 AM, Bjorn Andersson wrote:
> On Wed, Jan 28, 2026 at 05:18:49PM +0530, Ritesh Kumar wrote:
> > The initial sa8775p eDP PHY binding contribution missed adding support for
> > voting on the eDP reference clock. This went unnoticed because the UFS PHY
> > driver happened to enable the same clock.
> > 
> > After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off
> > calls"), the eDP reference clock is no longer kept enabled, which results
> > in the following PHY power-on failure:
> > 
> > phy phy-aec2a00.phy.10: phy poweron failed --> -110
> > 
> > To fix this, explicit voting for the eDP reference clock is required.
> > This patch adds the eDP reference clock for sa8775p eDP PHY and updates
> > the corresponding example node.
> > 
> > Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
>
> Is there any reason why you didn't follow up on this patch Ritesh?
> Looks like it's ready to be merged.

I was waiting for patch to merge as there is no pending comments.

> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>
> Regards,
> Bjorn
>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
> >  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 1 +
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > index e2730a2f25cf..6c827cf9692b 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > @@ -200,9 +200,11 @@ examples:
> >                    <0x0aec2000 0x1c8>;
> >  
> >              clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> > -                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> > +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> > +                     <&gcc GCC_EDP_REF_CLKREF_EN>;
> >              clock-names = "aux",
> > -                          "cfg_ahb";
> > +                          "cfg_ahb",
> > +                          "ref";
> >  
> >              #clock-cells = <1>;
> >              #phy-cells = <0>;
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > index 4a1daae3d8d4..0bf8bf4f66ac 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > @@ -74,6 +74,7 @@ allOf:
> >          compatible:
> >            enum:
> >              - qcom,glymur-dp-phy
> > +            - qcom,sa8775p-edp-phy
> >              - qcom,x1e80100-dp-phy
> >      then:
> >        properties:
> > -- 
> > 2.34.1
> > 

