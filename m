Return-Path: <linux-arm-msm+bounces-93238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LXFBIfxlGnFJAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 23:53:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A730151A2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 23:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D95F300F9F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 22:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D103D2D0C9D;
	Tue, 17 Feb 2026 22:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdS+q0Iv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDqKYP8o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6D2C11F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 22:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771368836; cv=none; b=I1Skex3bAC7YQeotgx1BC0PPgZxDPYwv2Qr713IQMDg9wMa76mGKcDmxpEnfy+8enH7KfN/91Q5HSOhq1w2UwtD6flmu+8Yi2sjEOa6MAGjTMD2FTa57/8cfYvi+2Q8Xfj0/X4Rt15GSaZlYXcKWwrlJc0fbu8Tcm36dx5PBg94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771368836; c=relaxed/simple;
	bh=aStGw+UwDV0WAEvkoPKUht/YsPOjCK0znfK0GN+9aSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGcfPHeB6qXdl3kUkFu3ImzO1HKucIK85H4YDQ6w8tDVlER+VVrspol3tcLshTa1PyKP65eVQSiSnLT1RtwFhFAd2Fu/2sk2v62++JmWsDmjhli10U8wRrZjsYl6oh7yHceic5GNRT1Yq176Oi7GK8xZ6KoiazeegfpoyIx5L68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdS+q0Iv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDqKYP8o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HLnOVC420193
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 22:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KFJ8odxFzblVi42AM8SS+2bN
	JLxZ7+uHabMbW43T+6U=; b=kdS+q0Iv/r5vHoRc/iv+CD+Ha+JBLFojK3ICjy9t
	UXMuitij3ux61ywVDw6xFMXIsePa6cERUGHb8DTnI77gQ01q+ORd6klvSRdIupBS
	2yZikGNabjLDrV/ZiIpGzipQFC9ERYZAOXoJhZxt07tNqF9SG9brdSBWQOk6zHGi
	wuTC+DcCeeR3Mj4QYvfEBkLirQ0RQs3qf4cnIkTCrIF0welXtel5h0itiFJgfLsm
	vH+yHkaFe6AA0cPdmoX43A7slvirAJBvdKZ6oUREu7tWiptouu8VltS3kXPzlk5b
	UkPzKIlZNZ2GamvBHtSjX6w5P1rW7vfcJ2kRJ0Mj8b7idg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd0k5g5r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 22:53:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so256487985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 14:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771368834; x=1771973634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KFJ8odxFzblVi42AM8SS+2bNJLxZ7+uHabMbW43T+6U=;
        b=kDqKYP8o5Pc+la5WPe9rfJUqcc0BU8WtLzA4fJ7NCjd4nc3aXBfD3slo10sckne9+E
         oX2+yRSB9ll9qbuUJu+vtQSMDUCSBdQ4RTx8nCXGAOS2BLClDL7rzGrZQpD0rebZrans
         BnFPgLxmDGdCbGlptAWAmn2MX+Q4k4qUBO5UXcfgU7AsolsF/nNP7lUeDE/KiytmSVvk
         DgjATHZEpciTRJusH2Rdv0eaKb3ZyurkQyuBP5TN9D3Eh6cWKvbaS9wlvCyo+EqMTVEe
         W7Mgg0wT3AFOHJ8ueVbGtoMLncZydIufl6E5pVnh8FPJFLwos5CpmoPTfG65Q5FGdZ2I
         11Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771368834; x=1771973634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFJ8odxFzblVi42AM8SS+2bNJLxZ7+uHabMbW43T+6U=;
        b=F4afgd6PxE/V8uqKGEHsx/cdIE9nPJ1i+NeJh2uOx3op6rO67svMAW83tlkZy5uBv1
         7IUZL05KMXBT60cfftaIC8HkhINploTuDbawxv78UOgtZz3pt+79ZEBM1n6XHcdRpJbO
         IKBv+6KEJNoccCRFQO89P8PdVbgs9Y2NLZX2KgWsIB7Y2bisxO8p5J5CiP2eHcEePoa0
         erMKfiJX7BJ3a/yDOkTlYuWvPnkgfpOeVyavYJLt/TA3tY72iDUmDfnOxmLxPKzxyHMj
         dTLYQnEePX4/MD808pOo3K+STMz7GMQTcyKsVeSb0wzv96OMYfE7J6g+F0RJu+5rL0S1
         6RJw==
X-Forwarded-Encrypted: i=1; AJvYcCX6fplB0tuqOcDniCVKZ70kCouIlz7KZmmIJ7hihp+vIeyP1cSd/pdUKhn/9u8I4SpWUCpEo+HlaZCoE0hk@vger.kernel.org
X-Gm-Message-State: AOJu0YxldBWnXkyDsyK4zsJWSsx+XTRzMcAiY9v6qRbO6QYOfQsMxfRx
	3NtfP7ANZjpLqmbtoOCO229R8INLhh5iPKbc7iN9/5/swOnFAueSI8uuEyPMIl5UeemxyTtOw/e
	ZINrCjn/4ogDIcEt5F//0wJZBsH5co6wZYfgPo9eyesJXMLStqv9OUNCLNzxTFsKGhz+k
X-Gm-Gg: AZuq6aJItsq/0PYTbwlUqp7QCNWfAnneTW7qnNjWKdwAr9GiFpr9Fir8JM8+AzvRKLP
	l9Gm7/abl8j6qKQxcDxEfJ9Gs44iGUevnJSd5rfKakMaPmSc/kR59lPb++BKm3aUoqzg+3V629N
	V4/91rS5XJlspEKHHvBm0A35v62zXBFwJkMGUiWR/gBpoj+J7QO7WYy2lwizZXYa9eovzDvw4ll
	N5aF0nxvXirw8icq9hQy7fVMIwwaMsqnOYrk9t9V81blH68zXrvQBRj3jGYieTM+LUXnktD9502
	wqFWjo1eCEwJR0R3rOCgu3o6mzPH2wu7V2E1jaLxZbxozD/RzJyB0S4+7U1nU2xzbjMxddR/Y9a
	WiXOmjzjXsDF7jwsMJ7Aks3J8A3PVw9bn3OvlwV84U3TLcl3uFsqcAjevbDTSSXVu91LHG+tFg5
	5X6iXdEK0E6lY5Xfg8qG4VuGMjUcI8h9eGhVw=
X-Received: by 2002:a05:620a:f02:b0:8ca:370a:3ac4 with SMTP id af79cd13be357-8cb74153061mr3854785a.12.1771368833570;
        Tue, 17 Feb 2026 14:53:53 -0800 (PST)
X-Received: by 2002:a05:620a:f02:b0:8ca:370a:3ac4 with SMTP id af79cd13be357-8cb74153061mr3851585a.12.1771368832950;
        Tue, 17 Feb 2026 14:53:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a50cdsm4148569e87.58.2026.02.17.14.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 14:53:52 -0800 (PST)
Date: Wed, 18 Feb 2026 00:53:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <i74iyesupz2elaoefyn5s5r53op5aifftcmsgktk2pyghozvwx@usg4hp4wrtug>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
 <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
 <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
 <203f6f63-e81d-4db5-8ede-ff6695a847ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <203f6f63-e81d-4db5-8ede-ff6695a847ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JqX8bc4C c=1 sm=1 tr=0 ts=6994f182 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=9HWWG6BkxvpKG1uSktwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: mTLvyBdJn_AxrY4zDAL5kPmOW6-vcm_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE4OSBTYWx0ZWRfX4ALuNR7LCU3G
 RHlBvkO+xj2MU2+59mNFD5p8AG9s1tsdIunJ2DPaSO7C87hKZ845gxaKSi+cu767X9/SGtpiyFY
 RLBdPS1loJJbmLge+IsKVZCJjyzOYFh/yepmB19Obwo5ppXVozSzBx1Eajye61cRzElVrx5wdtl
 h6zoDJbgYzrtRHDECNjRecdWO1HT1TY1DbHMCK0BLrKx4qEKA5Q3t9EmrfxSePyhQtlHampaDrK
 bAmdybHuDKOUtVLbphQ+lMXymqr3ABeUaNGtyRJohtzJmFyxeULdmfWlYuY2ZwfnfI1Dw45lTjt
 EiG+yWcRAsYrZ+pgSDktHofBxKU2yqOHLDlOMbvcgFvuKb41OsSbOMsRIfJMM1/IlFioqx7/Hsl
 lXRPW17mWGgFwB3tM593EHHfPc4YjKAsfTkCCluHeBTlOQ4hhKKbkhzBCVyNPtj0qxlgy0/Diom
 sumhasQtO+sU0V8H9Vw==
X-Proofpoint-ORIG-GUID: mTLvyBdJn_AxrY4zDAL5kPmOW6-vcm_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170189
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93238-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A730151A2A
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 01:59:48PM +0100, Konrad Dybcio wrote:
> On 1/13/26 5:29 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 13, 2026 at 04:31:15PM +0100, Konrad Dybcio wrote:
> >> On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
> >>>> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> >>>>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> >>>>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> >>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>
> >>>>>>>> To make sure the correct settings for a given DRAM configuration get
> >>>>>>>> applied, attempt to retrieve that data from SMEM (which happens to be
> >>>>>>>> what the BSP kernel does, albeit with through convoluted means of the
> >>>>>>>> bootloader altering the DT with this data).
> >>>>>>>>
> >>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>
> >>>>>>>> ---
> >>>>>>>> I'm not sure about this approach - perhaps a global variable storing
> >>>>>>>> the selected config, which would then be non-const would be better?
> >>>>>>>
> >>>>>>> I'd prefer if const data was const, split HBB to a separate API.
> >>>>>>>
> >>>>>>
> >>>>>> I agree, but I'd prefer to avoid a separate API for it.
> >>>>>>
> >>>>>> Instead I'd like to either return the struct by value (after updating
> >>>>>> the hbb), but we then loose the ability to return errors, or by changing
> >>>>>> the signature to:
> >>>>>>
> >>>>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> >>>>>>
> >>>>>> This costs us an additional 16 bytes in each client (as the pointer is
> >>>>>> replaced with the data), but I think it's a cleaner API.
> >>>>>
> >>>>> What about:
> >>>>>
> >>>>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
> >>>>>
> >>>>> I really want to keep the data as const and, as important, use it as a
> >>>>> const pointer.
> >>>>>
> >>>>
> >>>> I guess the question is what are you actually trying to achive; my goal
> >>>> was to keep the base data constant, but I'm guessing that you also want
> >>>> to retain the "const" classifier in the client's context struct (e.g.
> >>>> the "mdss" member in struct dpu_kms)
> >>>>
> >>>> If we're returning the data by value, there's no way for you to mark
> >>>> it as "const" in the calling code's context object (as by definition you
> >>>> shouldn't be able to change the value after initializing the object).
> >>>
> >>> And I, of course, misssed one star:
> >>>
> >>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)
> >>>
> >>> This leaks the knowledge that HBB is slightly different kind of property
> >>> than the rest of UBWC data.
> >>>
> >>>>
> >>>> You also can't return the data by value and then track it by reference -
> >>>> as that value lives on the stack. This has the benefit of making the
> >>>> lifecycle of that object clear (it lives in each client) - but perhaps
> >>>> not a goal of ours... 
> >>>>
> >>>> How come the ubwc config is const but the hbb isn't?
> >>>>
> >>>>
> >>>> If we want both the per-target data to remain const and data in the
> >>>> client's context to be carrying the const qualifier, the one solution I
> >>>> can see is:
> >>>>
> >>>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >>>> {
> >>>>         const struct qcom_ubwc_cfg_data *data;
> >>>>         static struct qcom_ubwc_cfg_data cfg;
> >>>>         int hbb;
> >>>>
> >>>>         ...
> >>>>
> >>>>         data = of_machine_get_match_data(qcom_ubwc_configs);
> >>>>         ...
> >>>>
> >>>>         hbb = qcom_smem_dram_get_hbb();
> >>>> 	...
> >>>>
> >>>>         cfg = *data;
> >>>>         cfg.highest_bank_bit = hbb;
> >>>>
> >>>>         return &cfg;
> >>>> }
> >>>>
> >>>> But we'd need to deal with the race in cfg assignment...
> >>>
> >>> static struct qcom_ubwc_cfg_data *cfg;
> >>> static DEFINE_MUTEX(cfg_mutex);
> >>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >>> {
> >>>         const struct qcom_ubwc_cfg_data *data;
> >>>         int hbb;
> >>>
> >>> 	guard(mutex)(&cfg_mutex);
> >>>
> >>> 	if (cfg)
> >>> 		return cfg;
> >>>
> >>>         data = of_machine_get_match_data(qcom_ubwc_configs);
> >>> 	if (!data)
> >>> 		return ERR_PTR(-ENOMEM);
> >>>
> >>>         hbb = qcom_smem_dram_get_hbb();
> >>> 	if (hbb = -ENODATA)
> >>> 		hbb = 15; /* I think it was default */
> >>> 	else if (hbb < 0)
> >>> 		return ERR_PTR(hbb);
> >>>
> >>>         cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
> >>> 	if (!cfg)
> >>> 		return ERR_PTR(-ENOMEM);
> >>>
> >>>         cfg->highest_bank_bit = hbb;
> >>>
> >>> 	return cfg;
> >>> }
> >>>
> >>> This potentially leaks sizeof(*data) memory if the module gets removed.
> >>> Granted that all users also use qcom_ubwc_config_get_data() symbol, it
> >>> should be safe to kfree(cfg) on module removal.
> >>
> >> I really don't understand why you'd want a separate API for hbb, if
> >> hbb is already available from the larger struct *and* if a driver needs
> >> to know about the value of hbb, it really needs to know about all the
> >> other values as well
> > 
> > Please take another look, qcom_ubwc_config_get_data() is the only public
> > API, qcom_smem_dram_get_hbb() is an internal API.
> > 
> > My goal is to keep having UBWC db which keeps const data and which which
> > also returns a const pointer.
> 
> Right
> 
> So if I understand correctly, this is almost exactly what I originally had
> in mind in the under-"---" message (modulo having a static global ptr vs full
> struct instance) but I failed to express that I wanted to keep returning a
> const pointer to the consumers
> 
> So in the end it's
> 
> A) int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> 
> vs 
> 
> B) const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> 
> I think the latter is better since we won't have to store a separate copy
> of the config in each consumer driver (which the SSOT rework was largely
> sparked by), essentially removing the ability for any of these drivers to
> mess with the config internally and make it out-of-sync with others again

You have my vote for the latter option.

-- 
With best wishes
Dmitry

