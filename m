Return-Path: <linux-arm-msm+bounces-107419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFneHKrDBGoxNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:32:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 77188538FC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAE66304CC32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09263A758E;
	Wed, 13 May 2026 18:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxb4eT35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsaTyfiw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239BE3A75A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696634; cv=none; b=Aqic75NhlizDkwUs0ZfRJ1AF9mwdEHEuMReunKpt6NAWaFbeH5VSpf99pAmG2AB69sZ7Il5uOKt4OEo7DmS4Gnakp5d6/tdk9ld8u4EVF2otRKh/ZcBYTDCqEKvUoqwZ/g2SaaNHIJy1fGNPpygDcRiCzAh7bM/Ei9Qf6ArVskM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696634; c=relaxed/simple;
	bh=CP/Usd5SOY/V4EM+27lYpiqg54wFGw4ZjWsp+w6ne5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lDv9OQJEbi9VNgOJrCQcJAF++MbukZl26aFARa69iSDCtzmrcV++qO17v44+kqepd4GvxANwfEpRD8ESyjDyPbme8RtHSJHYwP4XyIwsPjbgGcfnUlrQAojcAogPBqIzAV7dthrj42uoA0vMas5/9G3kafwjq3ODpYNiy6T429w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxb4eT35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsaTyfiw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFddQX1242779
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/8lnfbEOX7ej5tjeRNuBsa
	gcrk13r/0jAm1jfC+Xj3w=; b=mxb4eT351HYUVNlaFmZ0YbQdmIqO58P1ttDhsi
	LZ62cFmcw4jzMfy5sq7dc9VPZVpJ03HTiRQZxoOyvywpTsL8tUb0NvneP2g75+0c
	AJYFN0IkImN4tdEAR53mJY8D7NQMwAS24bgVMFzTC55s8cfgtOmKOmiIFMH9dbZ7
	G1BpMZ734vtj9Q4wXel4ZBn/sed0rmZQqLn/gZp7T87xxUpRadk/9H2XA51IXhD6
	+/p57z4p3ajZwI15QX4ktjBUUnvPvvp9FJ6hqHQTIvNopxrw2tpEH8DG1Tsmiesr
	ZDbcduU/D2tAtc4NCTUgz+eiI0U688wmj+nj3MV4sscwxGCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trmuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:23:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514ae0edeb6so104260171cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696631; x=1779301431; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8lnfbEOX7ej5tjeRNuBsagcrk13r/0jAm1jfC+Xj3w=;
        b=QsaTyfiwWAjCtWDonIthW90M/vqtcVmBSnEHLwV8yzJpaeg/MBmgRDdV1pOIj7Tlk4
         BjIBf8odjvJHvJe0qEvFvN5hm5HkFu0GlXdpYgSFI7YCEQb2kmI7nXQB9ESEctslqtFa
         a+Mr+5aUyvUBrwvrf4VuP3LicblEydeDYAuXegxIkGPW22UFzllQ8khmGwHr7aQP3j72
         wyiXLiBP0WRT6EuT79J6pFdkI90QvjlUWM6b9KjKtwm1yoRhnXY3kDoq37MIR+nHHvwM
         BZmFH+jbs0eaDXyYxpuEUzrCo+OvJkHC/WGinRw1BfoBSJXWlCh2BiKBnzcveBMIqwS4
         gmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696631; x=1779301431;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8lnfbEOX7ej5tjeRNuBsagcrk13r/0jAm1jfC+Xj3w=;
        b=UHLqpQC9VYKlU55BktHH6rJZmlJTOkyo9RJqSQ8BeVw7EgGKOgKu0qrz0F7/yUziXS
         Qmif+bdXtUgdJMyF99pifMjI3eZ1X63UFEWGqDS90lX3JgrGCTV5lUEtfjWFo68XlsX+
         pltDH1IQII/K2EP2bEN0UnwRLhUD9bkhc0hSduNLUhqDAX149tI8yY+v40qe0mVZnF9Y
         arodSk97NW4K1UNITcI9V1/SWQAHObhm+H5BKYRV2y67VTwQr3fIADyvwUN0Cg/z2Yao
         9CUlBGUV5kO8wVgi57ZRBHo9QU3YRF71tE9smNzt5Xj/YjitwN/nQCtvnx9NV5/YtErm
         O1Dg==
X-Forwarded-Encrypted: i=1; AFNElJ/hImaW7q475v18bYmq9m/3nBPwYXPMv48prKNHiphUBC9aV8N29c+Bl7vHnhFkN5VrlckVyiY15XVZ9CZ7@vger.kernel.org
X-Gm-Message-State: AOJu0YyIP+A/gusJNV8Rj2tXlXBjGRnKG3UMLoE6dGEyeVYlj0UMOPcx
	CBDNXt9aDolrqWCyGHI62GEfofn2ccFI6kemZ75VoNdKXhPJ876YPQTaHrlor/thSVvyGORBJtW
	PeFQxTi8FnKqpSHIvOluRZ/JzsTElIbNbeAH7bRYFsbEf0+Qk2EWylWGVZlvUtN3Yk7gz
X-Gm-Gg: Acq92OGdBzqxRaz1M3TzlxkA2bnPJI/xsnnGRvfRKFue6UukOYQFIVwrlH1OwhtFt69
	Uq3HqHgAU6aBTCEPw0eVz1hLI+hsj0z/SJe+eRrDOtfo4/ucMMIrvKQpDJo8tZ73qSXtrLAcP5C
	ZeCEacQc/jZEICCWgQi3l0JnqYdybQSg3i60NDJQ1hCJMLwPXetvyhAfI2JkvUwbWe3ST6oM8Q9
	gnuD885WybBd+fzM1squ23NwS6bu0i4UYFnz6DdcVBGtyz/kqaHkhLdG2oDT0s/ml1YKYI44ddE
	X0JuMAO6aEHyp0udt/RIgYve9gRoMMQMfouFBjO4R7WBsOVM1dk+tseJzbhJoojxBUStFSWKwnQ
	B2ku2IHD7Cw04HAISxwXAgyfigpN2/nvvMtWCfKPOVrKu87z3/mBZOqI33WPDidBKmKzsCRmYvu
	2Qsm/+L3+E7XJi67zUbaPhM8xe13MbkVw+mSA=
X-Received: by 2002:a05:622a:8d09:b0:514:cf96:7638 with SMTP id d75a77b69052e-516415a239cmr8445941cf.15.1778696631213;
        Wed, 13 May 2026 11:23:51 -0700 (PDT)
X-Received: by 2002:a05:622a:8d09:b0:514:cf96:7638 with SMTP id d75a77b69052e-516415a239cmr8445451cf.15.1778696630558;
        Wed, 13 May 2026 11:23:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:23:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND v3 0/6] drm: handle IRQ_HPD events correctly
Date: Wed, 13 May 2026 21:23:20 +0300
Message-Id: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3154;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CP/Usd5SOY/V4EM+27lYpiqg54wFGw4ZjWsp+w6ne5I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMGzqxLK1D79sW3iq4HpOWxquvyKBFjpVcB34
 h7vCOrJ4kmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBswAKCRCLPIo+Aiko
 1XrACACZbqw9UPGnc0Rq1LLAPf/snNnVdTZVsXFY41YM+aZS+S0oinCBEk2sFDi6DoOvzVrXO4f
 lZkJKpaBOfQOOmh/eVRIl26g1+GDmKlBT8Wt+DTKHGPFZBELRDHOxm2htwzcF6vWOt0NMqOgYnL
 KgXpWk1I6X5nYD6PVbvE7LO37A8PZZqnrIzMeZjE0SiiJvP6x4poYkeeQp+iJ6tSO4ifjQnsjq6
 6DfAK+vsWVwkacAZjGeYCM74uqTOs0Sj+5EgbpmRcyvFZ+k7YC4lcoQHZSF8SE6h/IpU7aL9nlN
 4WIucg9m4eEPgQevK++Tmqs5JqKyrxqXDLUu4aSLWOCxV60V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04c1b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=52TPwIQhNpV4Ze06EwUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfXwH6cGoZ5Brf5
 eoyaCFQeMup2k4q+y+WXE/SsfZK80vqpPREM/3gdzRUAK6IoFb04yqjSS3DWtIDlpxPGfGfX2Eo
 Nq6ih/1Gomr/mji6Xd73qERXLrguEZpFkK+Y/AzikM5KHOk1QwlubDzgOjjhWxG5RAsbrfrGTYb
 Rz8vXVh9ZgZ4ImuQO2l2BsrV/vnVM9+a+2GHx03LGv3uv/yZnsvdBqgpl03WXiWIWmG+MDAQeO+
 Zz9rAf1ks5tUB0bhbfG5i/jJ0JJ8bTkVkp1P8/MCzIodlu+RTQ3qj9OevuU2/AH3vx8ixUGr1es
 kFANxVzqp2QnsMKJTlHsAPVnt1/9Lm5CJml/OfeCjGQDH7s/LGQuSIWYjWIJsEQnBGfw0dPzzET
 VBv3tcQT9sQ+jTxAZ7sRjwDWmpUYUmBrXt2KCpVkf1HkgJITVjZV8KvnDIjF1ambAbW0tRvyD2J
 RQTjoL3b0ztG0VUJzvg==
X-Proofpoint-ORIG-GUID: 1j4kk4FYda3rx0YG8sS5NWh52AIFXlpA
X-Proofpoint-GUID: 1j4kk4FYda3rx0YG8sS5NWh52AIFXlpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-Rspamd-Queue-Id: 77188538FC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107419-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

---
Dmitry Baryshkov (6):
      drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  4 ++--
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  7 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  6 ++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 15 +++++++++----
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 22 ++++++++++++++++--
 19 files changed, 138 insertions(+), 51 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--
With best wishes
Dmitry
-- 
With best wishes
Dmitry


