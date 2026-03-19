Return-Path: <linux-arm-msm+bounces-98650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id B5dXKUebu2lhlwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:44:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DE2C6E4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7030B30610F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAA6355F46;
	Thu, 19 Mar 2026 06:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFRTgbgD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTUdJ5Eu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1DB34E743
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773902660; cv=none; b=AfY+POgpCQgj56jccvm34HEYXFjfTObSE0JidhlB/X3DTPBeGsJhVYfTkWQC6mVhv261hMjnHTaIjFSoPcnfi35YKK18514Quob1LdCgB936UDviSBuOGc5MBjjtUxvFM6XMqzs1blRqwAzdOShCk+Tl1ZESrkLue0eCwljDnbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773902660; c=relaxed/simple;
	bh=wP3MwRCpSfl2TFPPo9rCnDnkHKD2ZsEbQBPMQ0JZDd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifc9PWVeczhDifhXaHex2g67y2sv1xhXVadjkIVGWFFrfvsHZ2lPbGac551O+v2Lf4LvJhR6h6yhwENA8itU9pkTcBr1gM0pBjXC1GpqKI8pX5zf9p050vwRQFyXm957l5MUBgFa2Y9mhW/3YjeOrXmUeGT0x/ujFgg2fh+GfRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFRTgbgD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTUdJ5Eu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XPgk3574155
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KfmV7OgeEPnfHDNSfi+E3O0gIbXdlECurD9X3fopNt4=; b=SFRTgbgDbxlv27Tz
	sH1ehMGudIBx2asVp1A3l9cxkz6ywaWFoswR6+6X6pIbyeLGFsCAau1fRHItDJK+
	UB7t/Eeec/9MjSq6e7JidncYlGv6OuOXzxcgtJBi2z/3kHCeQJia1htY840VbdoW
	LKQg/+3Ya2iZjWrRI0mXOX4oK1E3+M7WargIB8Yq9lZK1NsUC6ix1UtoG80I5Wbj
	Q8vwINhBRnNTVS5qAUQENtMVIwb2m/5PSdSUL6H2DJyGDbj4dOnZ7IWbXEcf6gJN
	ylSVxr5sTpWLHhdbVDxskd6KBcClKDhWswgh9e4ItOHxacY+AtA3oF0jFRVM59Od
	7D+7Ig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r8pkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:44:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090bc4823cso35761731cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773902658; x=1774507458; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KfmV7OgeEPnfHDNSfi+E3O0gIbXdlECurD9X3fopNt4=;
        b=jTUdJ5EupqreIpNIRS4cDYIrzgw99ouiORChbGM+q3gewg+mntj7wjgY62r9z0V/IM
         Y9a+1omSjd5kv97j5qWm/frzxtNBxbwT8ELUbCL0YMfiwEuabC3aa+Kr4rlfFBh2GWTr
         vHaI1sDtJsmJeo/JqHg8t3Ur7GHTpHgbpK+eDcvcwEA1xeMIIWZTjfM4dKu85QZhhnyi
         yhQjPfyE1y+NbWz+svKy9HxsphcScHXk2i+AHPIqSmkZBCqhVTjd9tZHoeOikkc4MGyF
         0jm9SoUqltM716Uow1BNZWY9M/hafn4viMQM8L/rZEYEbDyG8MS4BBJs1Sg39azD1WpI
         9MGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773902658; x=1774507458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfmV7OgeEPnfHDNSfi+E3O0gIbXdlECurD9X3fopNt4=;
        b=sQG+gZGp/R5be/qlmFQza/oMvx1nNYR9uN1Xl9+540yFi0pWR38Q0L57mnc8idgiuM
         XEgLttPgWYAJhdCFCZ3ELEr0DOrUS9gzNdMsUaamK1PAQvSjOPbYGR3rfS/cJIBBtyAQ
         11TzFBsezc8FtJRpYgSVTZXnb406hs1jYwSGN/uzz3pVCCj3byJxX/gm4iwAfN71OmvQ
         gQ1dIf9h2EOm/gZRq0hFcTv3iICYLYRHRI+YRKPWDyBkKlLOLWRkl9By0VTXnvqx46+V
         yfqBzHIzBgS+ewZIwbNykybNrTBPON9d2zt6HUXtL/YAEwv1ONulhvnzdhRPapWXWwpt
         CFxA==
X-Forwarded-Encrypted: i=1; AJvYcCUlxeZtSpa5JalqCcANZPuJSScUkhka/xd9C5bI22WEenKoxLgiJdjruAhxm/At73EVaD7feRowukUDO2/m@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0zi7CZ+UxKyZ87xtuIcpzcBwXj1g0rvL2oOBWJyCjinkFhgMe
	EBMY6hx0dZevpMQk8GyN60mc2hXnOTqWAC+GsXzsT2Z+haJQGFg1iC5GEQZmXrZPm6wEfEb0+f9
	CjfuWVw47nJT6KpfbWbFyOtRvqKVN8jwmgt7XM5ZGtN4kYVgTE6WCRG4y630O8LtcDHXJ
X-Gm-Gg: ATEYQzy1I9dwrzABvCNH6d0KSbeRJ8dHwthuRjNDpa7jKkdKjiFfBnHu/yR56vsaWxY
	ynF8WYiwuKnNvhJ1+CE+BloJwtDq4jHJXqwyNi0/ChHg3IgfxNw+NksvBbHgnhDToZOx2LjY5/X
	iEl+sEZtVmSyXhNbWWhFCXDk9dWnLJOWjajZZ2aSRzOPztR5s/ZyewEAA9mkzxcKHDhwUblwP4n
	X8uxTgS9zYtjlPSnBrepzXPlo/iEdln5FOiZJeA68DuU7NWkCrPrSIuW09Prp7vBGNKfEnomo1K
	oap9iM+Bt7ggTGYOazsqLhWCwX5rPnqu/noA+rHkSmQaXk0i5UKSm5AbyqeMO5b+4izACzjW6RE
	FW6W3uomr/6ftllqJc8fTlVvons2h4AOnC1+/PrtHF1LXK0XECkLx9rm//xBOYIdkmv9R6ZK1Tk
	9h6IFJD7EGw0Cck6bUNoJRoa094IOST71OIzk=
X-Received: by 2002:ac8:5fd0:0:b0:506:9e57:8ba9 with SMTP id d75a77b69052e-50b1485dae8mr80442961cf.35.1773902657578;
        Wed, 18 Mar 2026 23:44:17 -0700 (PDT)
X-Received: by 2002:ac8:5fd0:0:b0:506:9e57:8ba9 with SMTP id d75a77b69052e-50b1485dae8mr80442761cf.35.1773902657057;
        Wed, 18 Mar 2026 23:44:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd51571d9sm11634871fa.4.2026.03.18.23.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:44:15 -0700 (PDT)
Date: Thu, 19 Mar 2026 08:44:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v1] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
Message-ID: <qc543ugvjtqp6wbsrtycne25xwiyx37blqq3wj6herzwpcuj6k@p3ydpkh3emld>
References: <20260319031040.4096297-1-shuai.zhang@oss.qualcomm.com>
 <mcjloavd6jhinb2wgfwihsdtbay5n7zv52tn63kzrabcqwyp26@mh5aet76kl7t>
 <1603a5b0-8edd-4c31-b2d1-344ee7df10ac@oss.qualcomm.com>
 <whqo7o6fu6mytf3hpdrrirptx3fpprnp25as3dnam6n4fo7tjq@dolksuaq4irz>
 <4d6d2597-df3f-4421-8760-ea59a46a3b39@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d6d2597-df3f-4421-8760-ea59a46a3b39@oss.qualcomm.com>
X-Proofpoint-GUID: JfxTOixjY2rj26LM4zuGRGCmBKCKfkZz
X-Proofpoint-ORIG-GUID: JfxTOixjY2rj26LM4zuGRGCmBKCKfkZz
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bb9b42 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=XhmMlDEUr4LgRsFAYB8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA1MCBTYWx0ZWRfX4l8BtcQeuuIa
 SHsK76YCNIM6ItrcMsGLh6KDDMuNj6fIWL1D2ArvZKbgKVEzt0nbG/lsdduyetzxdozQlITOSnC
 QBA2pJjd7bx/8Mj0lRBgvKcM3FUy68elhCVi+hbfQDSVc4p5j9Cd7W6QGXqfwYuhLTLp+8WdmcG
 2S9entkjltSqGfENHPEqniOgtVts6nb5olHovH+4JHWDw96j5Hcjp07RZdhJmUzCvZ8F3+xY7x8
 r9EYPoWJlo61B9afP8kLUli+w0cAONRusQhpuGbmA9oPkAlWoXHV2xgW0bnbQ+sfXR4dy/FembY
 cJHIvt121nZ/7YaCa+dM9oNJh1yxa3Giux8PYYFmR8cDKBQOLTcRNIPYv7djrZBu/ZhTV6IOuD/
 nrtPKhLiufARtvE38EO1sW4+oY04VWe+e1JdeQ21OXzMJ+8lLRoJWBpFyUdLihphYOcbwuCalme
 JBAu5A8I2fhT4geJ11Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190050
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98650-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.962];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB0DE2C6E4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 02:06:49PM +0800, Shuai Zhang wrote:
> 
> On 3/19/2026 1:42 PM, Dmitry Baryshkov wrote:
> > On Thu, Mar 19, 2026 at 01:21:58PM +0800, Shuai Zhang wrote:
> > > Hi  Dmitry
> > > 
> > > On 3/19/2026 11:51 AM, Dmitry Baryshkov wrote:
> > > > On Thu, Mar 19, 2026 at 11:10:40AM +0800, Shuai Zhang wrote:
> > > > > For platforms where the bt_en GPIO is not defined, software-based power
> > > > > control should be disabled when power is managed by hardware.
> > > > What does it mean for this chip, managing the power in hardware?
> > > bt_en is pulled high by hardware,
> > In which cases is it applicable?
> 
> 
> On platforms using an M.2 slot with both UART and USB support, bt_en is
> pulled high
> 
> by hardware. The current platforms are Lemans‑EVK and Monaco‑EVK.

This needs to be a part of the commit message.

> 
> 
> > 
> > > or described in the device tree as a
> > > regular always-on GPIO.
> > Why?
> 
> 
> This is equivalent to bt_en being pulled high by hardware,
> 
> and it applies to the same scenarios and platforms mentioned above.

No, DT would not describe the GPIO as always-on in this case.

> 
> 
> > 
> > > 
> > > > > Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
> > > > > cleared when bt_en is absent, aligning its behavior with WCN6750 and
> > > > > WCN6855.
> > > > > 
> > > > > Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/bluetooth/hci_qca.c | 3 ++-
> > > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > > > > index c17a462aef55..4512ff7cd0c0 100644
> > > > > --- a/drivers/bluetooth/hci_qca.c
> > > > > +++ b/drivers/bluetooth/hci_qca.c
> > > > > @@ -2484,7 +2484,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> > > > >    		if (!qcadev->bt_en &&
> > > > >    		    (data->soc_type == QCA_WCN6750 ||
> > > > > -		     data->soc_type == QCA_WCN6855))
> > > > > +		     data->soc_type == QCA_WCN6855 ||
> > > > > +		     data->soc_type == QCA_WCN7850))
> > > > >    			power_ctrl_enabled = false;
> > > > >    		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
> > > > > -- 
> > > > > 2.34.1
> > > > > 

-- 
With best wishes
Dmitry

