Return-Path: <linux-arm-msm+bounces-97970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Gt2IekSuGk7YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:25:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A767129B4C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82F5A3000B8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFBD2652AF;
	Mon, 16 Mar 2026 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWElH33/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLga6rvu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6BEAD2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670810; cv=none; b=FZE4tWCu5oMEP/qTFWHxe1vYHN7YHHrxjx5M99cm5UhX2xhtXMAhBr8rS+PfnKlwU4aEmWNzGq0J9jmNKQZ1/4YIB82WD2oC1H/iz63DEbCO9HS4rbkvuLEo+g3GVxwFyXqhA9jFgfVLsqDmx76siUM+3qfWFtREtqP0a/kUcDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670810; c=relaxed/simple;
	bh=VJgbLOKF32/JY2mcFzDIVAWh7ZTd3Ja3i6iJKudBOug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ur8H+HCNLBLeeo7D1CdozgLboTG8kY0XmDW7l6rdIDdkwNsy3lXqDtCEFXBBW5K0Ad2AfaxkmtHgtkC6lvyUkNO14qyLVeMTBAOv8Ox7LnPSa5Bjne7G7+s1sDclLitIlKgoJ+yaXKDU4UuW/2Ovwi2EpxqtmoA6KkgfcWShmlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWElH33/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLga6rvu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBjhu81428760
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TxUHkbY1+uD7pskAtrWbShEG
	9iLQurNswFCw0CeIiec=; b=CWElH33/WF/mCAwDr+5JvaVlolD9X04kd2dehi7b
	jklQymNq7ZTHMogdGT5GcbeEmqelah++bXAyUigLbdbf7iT46jbwJdxMZIRlTvJw
	Nng9hBhuX9oBPrEdykvD7a51IAzNm1TnctOxDKGJYKuVGYz8nMyJLkcg6YSaEmQR
	EskvCVaaCJnB52rkYOrDNJG6kH5TxfaJPs0A01JGhUl96NhMsYRmc4gG/dz3JCy9
	XkO4on1fzHAZt41MooqWoVGY4/yHOA8IFLvxXheMaUS3XIwBf7pmdNhasvF1du7l
	0PuA66cVPW1f4mNMYLiVDm1rv1YRkT8akSyKg0yThWnosw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh998k1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:20:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7de0e161so3264778985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773670808; x=1774275608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TxUHkbY1+uD7pskAtrWbShEG9iLQurNswFCw0CeIiec=;
        b=MLga6rvuyhSewb2p6ciu+ZS1Sqir6hy3jNMpVxvOENKHizjP1h8wuIQn3wp0Z1rjQn
         WYUQtrFs8LqPTYjhSdKs2gAV690ReQvxPalByEj0jhMzXKsx4T5gZTrs0Ho3ulehs3Ci
         qCNzJYpbRXwx1o9pvkLEyF/pbWKK7B+kZURmoD90n6gyT8J2tHcHPOBnmIPT4gpeU/j6
         dQy7FnxQ1PkQ163/hlzPh5QzK3DV1UL/1HL/mvW8ao44CJpbFuyegZQNM5tPMhab6dR6
         3HtHYsSqeFGk0yYJfmlw7VcPairmqNSoEykqICVhqsTq8VMDmS7+lW9WgAD2aTJh7OwD
         Wo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670808; x=1774275608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxUHkbY1+uD7pskAtrWbShEG9iLQurNswFCw0CeIiec=;
        b=QtOwbq1LqFqV8Yca+NdcqV9CVxs8uxTBOmqLVXNp90Mzh9Xq77cvxuVdn9GS4a92Nd
         ZrRg64kAE/RAb+ZOHUHEREwnOyxN3l/198aoBbKFB1mJuU2zWKsHbjVh6Ox+gcNEAiPj
         xSCluCOmw9NB75DGw52wRM0E0/glbnMB9qH4pWmQXyA7ccQ1x410Kmnou/sHEhil3mWs
         oUyl5lrvZYDVxIZNFUSDSVfrrsdzvbsekCnr5i5wFv/RDi4UFSsBLZ/5EjPeALBWiZod
         zoOC3CfsOvx3d/a2GqmrNTMNDXLNuxT52wdEVF0v+ESILfbFDknDNugMy9VbVB7wyuyJ
         zlfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7yY34ieBeCCx9Pdr0WgitR4JaMa2MJMOPwud0zCRrFYutiEl/eOjOprt2Vwp4G9ZczfI2Ysuzjgc0YJ7U@vger.kernel.org
X-Gm-Message-State: AOJu0YzKdqMDZEx1DrLPls2FRsFJJmHzYZBCWB5fnOb3CghCXevr4sR6
	3uo0P1NxvJaT4NlPQmm0FYr6VnqQZ8F52hss39CVj+smhoLj4S9h6ipPi1/Q4uhAZjlzinFAIPN
	D/9yuxnepVFBDFaYecGEWHMei2TVF0geMruciEA3GmdLwxguSUNwQyQtIh+qIpsKdycvY
X-Gm-Gg: ATEYQzzUh5W/QIXKkvw+lVFgR+0kzJvjk/c0SgAW38GjHqr7dda0z4W87qUi99rKnyi
	7JhHSBo7LDEH+qYGD0ubQkb1gUR32pTdpnm8PAXkR96UUgZk0fE4tsKfQMNNQQcqveVPXtiuJvz
	ZJ8oSCUbTnkfooNkMV7SYCezW6JsLIbv7ANDne4OZlUJaUtwr/2DnJIb2KLhJe2x+R6eb+zjSuo
	D6GzZWKxL/wLHA1TNlY0nV48V7eCFqBUq+aVXLodgwVfniAaUTF1gAZePj3NcHgsjuzOUVaLZls
	ojB2HDbC29ZBgJqpMNRi2AyiMSRj/a3YU7IpFdjJeOS0XKnzA94lCszvB3HnAJ2ig5B+U1IpOna
	xMvR39G3qMGlcYN3r3XGTaY+V3WqnOdmA6/zW+fJfxeYEvZ3JVQ+2FR4V2jViVoZE9HtLRAIhiW
	bGoPCRfY3r4dwGiyjKaqSQQwwyyLQj1vr49eU=
X-Received: by 2002:a05:620a:470c:b0:8cd:9a1d:4fb with SMTP id af79cd13be357-8cdb5a1c9a3mr1597400685a.10.1773670807583;
        Mon, 16 Mar 2026 07:20:07 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8cd:9a1d:4fb with SMTP id af79cd13be357-8cdb5a1c9a3mr1597390885a.10.1773670806935;
        Mon, 16 Mar 2026 07:20:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e18fsm3431479e87.22.2026.03.16.07.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:20:05 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:20:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 17/27] drm/msm/mdss: use new helper to set amsbc
Message-ID: <igwmdjbd43xdhab7vgqn2oaxh6yddbp5qe4zmh3xjyq7ix6hlo@itpftzhxkxtm>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-17-b7e8f800176a@oss.qualcomm.com>
 <19b36a86-12c7-4710-8f80-5e27c9c00e3c@oss.qualcomm.com>
 <uahvm7kvu2vi6o6mwznn5eqzqqscxmfetl4c3q3xa2eryg6ode@ltxfpjmqbrrt>
 <fe151ffe-aea2-429d-a725-4697381c4a93@oss.qualcomm.com>
 <hmamyk4lzo6ekswqvjlen6hc5stny2ucj5fxy5g2tvl3fqpbq2@ux7l4j4drm6z>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hmamyk4lzo6ekswqvjlen6hc5stny2ucj5fxy5g2tvl3fqpbq2@ux7l4j4drm6z>
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b81198 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=DwMc8GUcov4CxI8nvuUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwNyBTYWx0ZWRfX1Or4GLjjMUzI
 l3mtflrU+n74mx3VMfKBToNuCubXJAkhFvLsifbo9Ep8Z3unVlL57UAE6PqFr6ruVuuKvWoUejN
 jr3MKOeSLjyfJimiYh9S6hJFkALmxtCD1welb1mZAjQjNruGN5Yg7HrlnOg6i8uTxNNXllIfEyH
 2FvxZpKetg5YT3h/Lw6euivGOK6kYzKwmMAD2xhhTfbaUd1g9bopt2xMGV5MmraOP+KSE2g2wvA
 veiz0CkfhiRasNC1+WBjuFeK7d6ntAzCd0yA0WlQoVRad5VbBhxTw3FJTzjwnTEW5t9rencilh/
 EhLy7+YyKNjydAMfs72RkyZhdioyR91adTg8VjZDim3XIFrS0WtHgI8Y137+hJeDUbu6w5lW1Ix
 slHD4zX9sO/nsezhBnyljxAJRLNePN4xbBMWUygulnxoRA+ibfq+5yecjn5eV1O46lXv6H1OyKB
 26C7QAiNim7XXMhkmtw==
X-Proofpoint-ORIG-GUID: B_SUxbZTj6ZL9slq6p3XXEYFC6ZKPBhC
X-Proofpoint-GUID: B_SUxbZTj6ZL9slq6p3XXEYFC6ZKPBhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160107
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97970-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A767129B4C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:04:46PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 11:08:00AM +0100, Konrad Dybcio wrote:
> > On 3/13/26 3:26 PM, Dmitry Baryshkov wrote:
> > > On Fri, Mar 13, 2026 at 11:19:59AM +0100, Konrad Dybcio wrote:
> > >> On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> > >>> Use freshly defined helper instead of checking the UBWC version
> > >>> directly.
> > >>>
> > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >>> ---
> > >>>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > >>> index ca59bcdde7b2..04efc29f38cd 100644
> > >>> --- a/drivers/gpu/drm/msm/msm_mdss.c
> > >>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > >>> @@ -188,7 +188,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
> > >>>  	if (qcom_ubwc_macrotile_mode(data))
> > >>>  		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> > >>>  
> > >>> -	if (data->ubwc_enc_version == UBWC_3_0)
> > >>> +	if (qcom_ubwc_enable_amsbc(data))
> > >>>  		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
> > >>
> > >> I know it's already there, but fwiw downstream doesn't seem to be
> > >> concerned with toggling AMSBC in MDSS (perhaps incorrectly?)
> > > 
> > > Downstream enables it only for the cases where encoder and decoder
> > > use exactly UBWC 3.0. This is not completely correct as the bit doesn't
> > > exist for MDSS 6.x+. For 5.x this is equivalent to the code from the
> > > patch: enable AMSBC if targeting UBWC >= 3.0 (because MDSS 5.x don't
> > > support UBWC 4.0 or higher).
> > 
> > Right, this seems to indeed be the case
> > 
> > While trying to confirm that, I noticed that some lower-end MDSS 5.x
> > chips (like Talos) report UBWC3 in the register, but the MDSS docs say
> > they're UBWC2 - any idea?
> 
> I don't see a complete pixel format document for Talos, but my guess is
> that one of the blocks (GPU, Venus or Camera) doesn't support UBWC 3.0
> pixel formats. MDSS is just one piece of picture and unfortunately we
> need to use format which is supported by all the blocks.

And after cross-checking the docs, it is really interesting. It really
looks like for those chips we have used the older core for UBWC, but the
registeres were not updated. One more reason not to trust those and to
use the database instead.

-- 
With best wishes
Dmitry

