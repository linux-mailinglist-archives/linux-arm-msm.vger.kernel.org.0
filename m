Return-Path: <linux-arm-msm+bounces-91367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGdgJTPqfWmMUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 12:40:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B73C1B74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 12:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 073583002518
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 11:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87262FDC2C;
	Sat, 31 Jan 2026 11:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CblYUw9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiXHh1j/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D6428934F
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769859629; cv=pass; b=mCOuoD476Yh/cNoPAF2q3XCJwPtU4NZA21v1+A9+0oyFYxJ59vcsKyDrB0cvanVr7TjpSgZEwXz7RNLqIkljbUW9AntnvBkvQ/I/sS//hZpTV+Kz9vvcOt5uU8toWqJQZ1jbHU0wQk/9PMghomblRxL844ug/NA0jW2uLfmG/RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769859629; c=relaxed/simple;
	bh=D5/5aw6T7rznX8B9fPckkhcctQeA/SElEFom8nUkOzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0txeVd+QElt3Xu0d8stL2rbutzH8am1engoKzLf/Weew45FSZGkVCwROCdcPu5X9YZTXwEu3DMybnDpMePb2ueS3BE2SKYWH8WjxRzMuOmWWnYrfVzBIEyaybQMaMSlL7OeMJ2Ef/FhY50LNuH6qddXmcCPTxo3TNm40525ce8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CblYUw9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiXHh1j/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4U2pn447972
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 11:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hLCPImxmPtodeRDZCF9m3JGHBTylGyPwELmlVnUUTI=; b=CblYUw9JUxNCR3el
	ff7G0M+e/kIjpkYRqL1XeUO/cCBh/QKKrpNzs4lTuedLhGRQNf4fcyA2mH6JpHH0
	4QnnGzAhnmLRymiTqB+L34/1CwPckWO+Me4NjDNYdZ41Yu2M8g2T9ygyGpZ9JbgU
	F+9MAEEt/reBt0Ldv29jbrmz2a6ByPgr89zfMOT8lPVg6pBbc85v/L/HL8MJMLoa
	87CJtYPGeLZiyIjs8h9XKi5rSw1022i7InM7D2uwviNokFJzvQpI/qevT0Q2l9sO
	ZQzdef+FwqPTtUNIFjw2nfdJpP5/C2TcWciiEThxeeCp2bc5N73s2uy9UXe0ZXgU
	6L5eeg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0rqj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 11:40:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7701b6353so30757345ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 03:40:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769859626; cv=none;
        d=google.com; s=arc-20240605;
        b=lGAh34m1q4INeNZNztmwYWb8OAXcZZvTWtkDUTCLLOZ6jVp7Cc3PTy+ReEVoa6+2ko
         w0nainMipnrUYDHxW/QhfogrG+CsE9ehuwGEK7HKIlpPRK5WHOtUSgrrvnLPLehtJiOp
         aCA8yIzMnC4DHxxbuqCOkQFRTOBEgebXd7PaPvJyDviYjNdkZ4BQty1Q9ZI384bFybnC
         2tTJUQnUaESrHoYTBRH5Pmk6MZlwtGxmX4skJz3xUZ7w3eXfaWMJAUvxezeu3T+rUtOX
         MQSSSRAzpUAfqp1grSP4qFsHoImXM32ZANy7TuVLT8X35wBTFdVFBVIJYg672LeEIQaC
         kbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1hLCPImxmPtodeRDZCF9m3JGHBTylGyPwELmlVnUUTI=;
        fh=QLlobIFXEHtf1W7uYJTEBr9iyRyHP89eAYQtN4abOKs=;
        b=J/SUsGHWt6xQy30Ewo1kgnE3QxFiEmOaP9X0R2CzlYHO16CrPMv7cGQj8xIjrmBMuI
         bvflcL0vRIUJf+ZmeB4eC7eY2UmJf1ddwvqzCtbjx3G60TlAAuVuCEtYQQwM3ZGvpmxB
         k+TUJr4bpbR/V8r/r89JcmBlmiXo2O9pq/pPH2IGw+OlC41SbqwoMNLBmt3aSxjptAMS
         xA8OdHfrLXpZ7gaqzxD4c0XKjQuZIvHArdExq5lFAPAGzM20+oRRExsEdc8T/QmaMzwl
         BwSDyJQuskEE31rnNEosZvHWO9L+YNdH+2fbpCTKz15CK5aghthPJLbWZzK4onPEW2ho
         bGEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769859626; x=1770464426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hLCPImxmPtodeRDZCF9m3JGHBTylGyPwELmlVnUUTI=;
        b=eiXHh1j/oTXQZld6YI7Of1n6Fo2ycKHM1pGWEWs6bArekDDPM1lbuM0P/6d7w8pUAs
         herOkrqEpLfxdqfHf9bCXLJVl1C0xRwGsqV00JyI43LPuLQzsw0c3VpwtzHhFbFVagjO
         4uCzJ2+xt3UIRx6gmHFfr1tHZkyHxZTe0I6R0rYbTiPMQY2+/XtmI6FiJVDUd5k0YKB2
         Pk80dkFCVeQZXhRNwrIb0CuaqLIMRdLLoZSb/mzLYeJLQizeuyFfk4JqJRXUCoPTbxzG
         1qST3xBLTFRvv/GkUwjtYCAMNjxiKy73m4RWWmvCy9v/k2/HG8yUVeW2XEoth2DRvwmw
         Rw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769859626; x=1770464426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1hLCPImxmPtodeRDZCF9m3JGHBTylGyPwELmlVnUUTI=;
        b=OHqdx5XZvUvRfgqQR2mzNkutxOXOtd1CZLQb+K9fmhxSGmMd/jTVbr/KC6tic5je5k
         xmb3SsYpuL7S5oa4pcLHnAAUzjlSamU6NGH2sho98ZndloLrV42TN1TgxUGlX/AMsSQ+
         FILUtZfMAnNC9Qz3n9TurVp5KtVDZikrQ5jwqJnxMcWBZpOyTQYbpKOe0AGyr4beJB1u
         nVe1UZG9u4SLfMK6mlIq9xeF6MAqFg+L5cpgt3OpO5SHBw8BeBW2QZM7eM9BYcqbtZ/S
         xPqkPpzPo5C5sNVPqt5aSy2zHHjRBIDFegoOWADL/ZPRmXBSfbdu3mQrhTKFDqOAo1Gk
         6iDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW27wu6QsWyPk8wh8PhDT/7wHKLpOt1beG07zW5XcjcmRAAfJsszYnciyQwyZgjvfbg4Kymwz+ziKDeP36P@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZckLpqSpYNEp3NaDcH+n/dqt1cRRcdszt12nJpYwmFQ4Dz1A
	PdqyQi9jG3O8CPWGJz9EGtO8XWuTT95Q3zWOEXItir+xpUupagaTmxZnk7RDZz0KwdVcdbZuP2D
	VzKMSzbTTZQGi7vHXGej2MhWzE3IA7DLINpX9j5kXs/T3wrgHvap6CyS7TCw4+tiOm5ejzT4oFP
	SnMN0OeDGXLoPYfaEkXZatxnKu5DkyrK3RruQtNNQ7+mw=
X-Gm-Gg: AZuq6aLXHcy2Xi/17BKMeE9NrztHxN6C9ffRbdkHk5/7YJHFl+zMok/JsGFrRA4H7cj
	Xbk+UuoTqKd+0o1Zf/NQ1nAG+AGs/duzdT3BFnda8ne1MTV4mtQhh7MIzFjK8HfDev3DOSbg8oK
	0DOpLd7v6GgJRvAbftdJB76ly+DtvzaCz4OvVHDUxKiuc6p4h0WAWCY0jKP287wbb0
X-Received: by 2002:a17:902:d4d2:b0:2a7:bd4e:db92 with SMTP id d9443c01a7336-2a8d819e205mr66894205ad.53.1769859626383;
        Sat, 31 Jan 2026 03:40:26 -0800 (PST)
X-Received: by 2002:a17:902:d4d2:b0:2a7:bd4e:db92 with SMTP id
 d9443c01a7336-2a8d819e205mr66893855ad.53.1769859625783; Sat, 31 Jan 2026
 03:40:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <evb5tn2cht7wk76fuc2wpsyxepknigfw37633n6ypuapstbceh@tn5glmi65bdv>
 <cb5430c8-12d6-4439-b1ae-c2f36f29a9f8@oss.qualcomm.com> <57493aef-fb35-4377-8cf3-1df7f53470c9@oss.qualcomm.com>
 <74h7r3vsig3csejax3eu3uk53mdiimg2hjx7ntmmfrwdai6s3j@eiztghclfcvt>
 <5db5dafd-3c1f-4844-b822-bbfe86b3eb4d@oss.qualcomm.com> <ctrpymbvjlchp3djnsqq4bghkq2zvqnf5bebszi74f3d36l5dv@icvnkdwgdxmi>
 <ef1911f5-2d96-428c-93f1-3d1815710894@oss.qualcomm.com> <98397a59-8ef2-4202-ae41-015c895d6bce@oss.qualcomm.com>
 <c5ace95c-6ba1-4ce9-b461-82225a9fc576@oss.qualcomm.com> <f461ca33-0892-4a58-a40b-6da2a32d1430@oss.qualcomm.com>
 <33kugspepphj3ywp642bp5ee4zd6pk6pxbooe4knv62coeofo6@5zqxy4n37k3j> <998079d0-1c38-4a93-a63d-6bf9c91c4a83@oss.qualcomm.com>
In-Reply-To: <998079d0-1c38-4a93-a63d-6bf9c91c4a83@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 13:40:14 +0200
X-Gm-Features: AZwV_Qg-4mj0k634ypSUg-nR-Q0j6WFiG-c6hXAXtU-2PphSk_SFRvfAC1L_bzQ
Message-ID: <CAO9ioeVxbAJR-JSVSVOgtZaTmwqaez=2K5Rfxo=+swUJ=YmN3A@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] remoteproc: qcom: probe all child devices
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, mathieu.poirier@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, amitk@kernel.org,
        mani@kernel.org, casey.connolly@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA5NyBTYWx0ZWRfX20rxWYsjVsiG
 vDls04yi5yZt5HoN7HWRnCNVxoMQs/VCMRfJ0n+Mh23wWZGtdGv27Pe5QCnzVbkS4NV0cOm86fO
 RQqhJtQ6HDY/CPfvTpC5kpuhmdwlCZpC4wJMc+zUQ85QmVELxid6kBjK+dTZpYSn2CN3pV9yFcL
 l3/mhchRgQWMGOafWcJsE+nUI4U5xKi0m91YjPl8UtRNQOzggUXLAy7loimlTqFfLWhr9ijDBAb
 z8Eeb1n1YvDZiz39EfPlv4Qhk0tTTL1P/mG/4HJCu5yl/b6SxqftrwrBSqaeH0MeBE3z470Upr0
 FFJT+4dsA2IPosHko2342eGofcZ/RobBErFle5URHotelCgNCGdqqD21FxnGs4KmtLin6p/AX2g
 ihnQP3QZM4cWQHZ7CqLQBBr9IMqp9VuNRA5U1roS554Cy32LMOhZu+moRjx76LBrQmNBSQDdjUI
 xCDbjtRWRIP42qf8FtA==
X-Proofpoint-ORIG-GUID: GLAcKlMXXN4CPn_rHqbo7RKapi5Eu6bx
X-Proofpoint-GUID: GLAcKlMXXN4CPn_rHqbo7RKapi5Eu6bx
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=697dea2b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=VB_UEgZy2yHdALp30g0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_01,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91367-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: A8B73C1B74
X-Rspamd-Action: no action

On Sat, 31 Jan 2026 at 11:12, Gaurav Kohli
<gaurav.kohli@oss.qualcomm.com> wrote:
>
>
>
> On 1/31/2026 1:36 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 30, 2026 at 10:13:06AM +0100, Konrad Dybcio wrote:
> >> On 1/30/26 8:03 AM, Gaurav Kohli wrote:
> >>>
> >>> On 1/28/2026 3:15 PM, Konrad Dybcio wrote:
> >>>> On 1/28/26 10:39 AM, Gaurav Kohli wrote:
> >>>>> On 1/27/2026 10:11 PM, Dmitry Baryshkov wrote:
> >>>>>> On Tue, Jan 27, 2026 at 09:42:10PM +0530, Gaurav Kohli wrote:
> >>>>>>> On 1/24/2026 12:33 AM, Dmitry Baryshkov wrote:
> >>>>>>>> On Fri, Jan 23, 2026 at 07:23:39PM +0530, Gaurav Kohli wrote:
> >>>>>>>>> On 1/8/2026 12:37 PM, Gaurav Kohli wrote:
> >>>>>>>>>> On 1/3/2026 8:26 PM, Bjorn Andersson wrote:
> >>>>>>>>>>> On Tue, Dec 23, 2025 at 06:02:21PM +0530, Gaurav Kohli wrote:
> >>>>>>>>>>>> From: Casey Connolly <casey.connolly@linaro.org>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Generalise the qcom,bam-dmux child node support by probing a=
ll
> >>>>>>>>>>>> remoteproc children with of_platform_populate(). This will b=
e used to
> >>>>>>>>>>>> enable support for devices which are best represented as
> >>>>>>>>>>>> subnodes of the
> >>>>>>>>>>>> remoteproc, such as those representing QMI clients.
> >>>>>>>>>>> Please flip this around, start with the description of the pr=
oblem
> >>>>>>>>>>> you're trying to solve.
> >>>>>>>>>>>
> >>>>>>>>>>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> >>>>>>>>>>> This must have your signed-off-by, where you certifies the or=
igin of
> >>>>>>>>>>> this patch.
> >>>>>>>>>>>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>>       drivers/remoteproc/qcom_q6v5.c     | 4 ++++
> >>>>>>>>>>>>       drivers/remoteproc/qcom_q6v5_mss.c | 8 --------
> >>>>>>>>>>>>       2 files changed, 4 insertions(+), 8 deletions(-)
> >>>>>>>>>>>>
> >>>>>>>>>>>> diff --git a/drivers/remoteproc/qcom_q6v5.c
> >>>>>>>>>>>> b/drivers/remoteproc/qcom_q6v5.c
> >>>>>>>>>>>> index 58d5b85e58cd..a02839c7ed8c 100644
> >>>>>>>>>>>> --- a/drivers/remoteproc/qcom_q6v5.c
> >>>>>>>>>>>> +++ b/drivers/remoteproc/qcom_q6v5.c
> >>>>>>>>>>>> @@ -6,6 +6,7 @@
> >>>>>>>>>>>>        * Copyright (C) 2014 Sony Mobile Communications AB
> >>>>>>>>>>>>        * Copyright (c) 2012-2013, The Linux Foundation. All =
rights
> >>>>>>>>>>>> reserved.
> >>>>>>>>>>>>        */
> >>>>>>>>>>>> +#include <linux/of_platform.h>
> >>>>>>>>>>>>       #include <linux/kernel.h>
> >>>>>>>>>>>>       #include <linux/platform_device.h>
> >>>>>>>>>>>>       #include <linux/interconnect.h>
> >>>>>>>>>>>> @@ -351,6 +352,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v=
5,
> >>>>>>>>>>>> struct platform_device *pdev,
> >>>>>>>>>>>>               return dev_err_probe(&pdev->dev, PTR_ERR(q6v5-=
>path),
> >>>>>>>>>>>>                            "failed to acquire interconnect p=
ath\n");
> >>>>>>>>>>>>       +    of_platform_populate(q6v5->dev->of_node, NULL, NU=
LL, q6v5->dev);
> >>>>>>>>>>> There are other child nodes here, in particular the GLINK and=
 SMD edges.
> >>>>>>>>>>> Do we really want platform_devices registered for them?
> >>>>>>>>>>>
> >>>>>>>>>>> Regards,
> >>>>>>>>>>> Bjorn
> >>>>>>>>>> thanks for pointing this, can you please suggest the right app=
roach.
> >>>>>>>>>>
> >>>>>>>>>> This should not impact glink, as that is registering as rproc =
sub node,
> >>>>>>>>>> And we need rproc cooling as child node
> >>>>>>>>>>
> >>>>>>>>>> of remote proc subsytem to create probe dependency only.
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Can we do platform populate for specific child, would that be =
right
> >>>>>>>>>> approach. or we should create rproc cooling as independent of =
parent ?
> >>>>>>>>>>
> >>>>>>>>> HI Bjorn,
> >>>>>>>>>
> >>>>>>>>> I=E2=80=99d like to highlight the impact and details of placeme=
nt of remoteproc
> >>>>>>>>> cooling dt node:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> ->As a child of the remote proc subsystem node:
> >>>>>>>>>         In this configuration, the cooling device will only be =
probed once the
> >>>>>>>>> corresponding remote proc subsystem itself is probed.
> >>>>>>>>>
> >>>>>>>>> ->Outside the remote proc subsystem, may be part of soc node:
> >>>>>>>>>         In this setup, the cooling device will be probed indepe=
ndently. It will
> >>>>>>>>> wait until the remoteproc subsystem is brought up
> >>>>>>>>>         before completing cooling registration.
> >>>>>>>>>         The drawback here is that if the parent remoteproc subs=
ystem is
> >>>>>>>>> disabled, the cooling device will still undergo an
> >>>>>>>>>         unnecessary probe, even though it cannot be registered.
> >>>>>>>> Bjorns question was different. It wasn't about pushing cooling d=
evice
> >>>>>>>> outside of the remoteproc node. It is about not registering the =
devices.
> >>>>>>>>
> >>>>>>>> Can we follow the approach outlined by qcom_add_smd_subdev() /
> >>>>>>>> qcom_add_glink_subdev()?
> >>>>>>> Hi Dmitry,
> >>>>>>>
> >>>>>>> Thanks for the review. Since the remoteproc cooling is a QMI-base=
d driver,
> >>>>>>> it will receive the
> >>>>>>> subsystem up notification directly. Therefore, there=E2=80=99s no=
 need to make it a
> >>>>>>> subdev node or
> >>>>>>> tie it into the init/reset sequence of remoteproc subsytem.
> >>>>>> But you've added a subnode for it (and we are discussing exactly
> >>>>>> of_platform_populate()) call. So, you are tying it to the remotepr=
oc
> >>>>>> device lifecycle instead of the remoteproc subsys, which seems str=
ange
> >>>>>> to me. There is no cooling device if the DSP is not running.
> >>>>>
> >>>>> For the cooling feature, we don=E2=80=99t need to define it as a su=
bnode. The cooling subsystem becomes relevant only
> >>>>> after the remote subsystem is up, at which point it will receive ad=
d/delete notifications from the QMI server.
> >>>>>
> >>>>>
> >>>>> If child nodes must be modeled as subnodes for rproc, we can move t=
he CDSP TMD out of the remoteproc and add in soc.
> >>>>> Is there currently a way for the remoteproc core layer to call of_p=
latform_populate() without requiring a subnode?
> >>>> I think the question is "why can't you register the remoteproc devic=
e
> >>>> as a cooling_device, with perhaps #cooling-cells =3D <1>; instead of
> >>>> any form of children?"
> >>>>
> >>>> Konrad
> >>>
> >>>
> >>> thanks Konrad, for the review.
> >>>
> >>> As each subsystem can expose multiple thermal mitigation devices via =
the remoteproc TMD service, so need to define child node.
> >>
> >> I think you're stuck in an XY problem - you keep insisting that adding
> >> a subnode is your end goal, while you really want to achieve being abl=
e
> >> to register multiple cooling devices. Or at least that's how I read yo=
ur
> >> messages since you happen not to give any explanation as to why it's
> >> actually necessary.
> >>
> >> In my previous message, I forgot that cells for cooling devices actual=
ly
> >> represent the minimum and maximum cooling state allowed. But since the
> >> API is just part of the kernel, there's nothing preventing us from
> >> evolving it.
> >>
> >> Currently, we have:
> >>
> >> Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
> >>
> >> properties:
> >>    "#cooling-cells":
> >>      description:
> >>        Must be 2, in order to specify minimum and maximum cooling stat=
e used in
> >>        the cooling-maps reference. The first cell is the minimum cooli=
ng state
> >>        and the second cell is the maximum cooling state requested.
> >>      const: 2
> >>
> >> But I think it would be perfectly fine to suggest a change such that
> >> if cells > 2, the last two cells keep the current behavior and the for=
mer
> >> ones let you index into a cooling device exposed through a single OF n=
ode
> >
> > This might be a big change, which probably needs to be coordinated with
> > thermal and DT maintainers first.
> >
> >>
> >> e.g.
> >>
> >> rproc_xyz: remoteproc {
> >>      compatible =3D "qcom,rproc-xyz";
> >>
> >>      ...
> >>
> >>      #cooling-device-cells =3D <3>;
> >> };
> >
> > Which brings in another topic. In DT we have labels for different DT
> > children, which correspond to different handlers on the DSP side. For
> > the CDSP we see a "cdsp_sw" only. I think I've asked several times, but
> > didn't get an example of the device having more than one, just claims
> > that there might be more thane one TMD.
> >
> > Do we need different cooling cells here? Or would it be enough to send
> > the same max state to all TMDs on the DSP side?
> >
>
> For newer targets, Within the CDSP we have compute core(cdsp-sw),
> npu(hmx-sw) core and both have independent dcvs and also dedicated
> tsens on each core.

Okay, inside the DT bindings please provide this system as an example
rather than using the simplest one.

>
> And For Modem also we have multiple mitigation devices based on
> different modem tech, for e.g tech level side we have modem-lte,
> modem-nr etc and mitigation at different power amplifier side like
> modem-pa etc. We have not added modem node for current series target
> as it does not support modem.

I wrote it several times: there is no reason to limit yourself to
CDSP. Please also add support for ADSP, SLPI and modem.

>
> >>
> >> ...
> >>
> >> thermal-zones {
> >>      super-rproc-therm-a {
> >>              thermal-sensors =3D <&rproc_xyz RPROC_XYZ_COOLING_A
> >>                                 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> >>
> >>              trips { ... } ;
> >>      };
> >>
> >>      super-rproc-therm-b {
> >>              thermal-sensors =3D <&rproc_xyz RPROC_XYZ_COOLING_B
> >>                                 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> >>
> >>              trips { ... } ;
> >>      };
> >> };
> >>
> >> This would be resolved by allowing drivers to register an .of_xlate-ty=
pe
> >> function which would take the RPROC_XYZ_COOLING_n argument and e.g. us=
e
> >> it as an index into struct thermal_cooling_device cdev[]; within the
> >> driver struct.
> >
> >
> >
> >>
> >> Konrad
> >
>


--=20
With best wishes
Dmitry

