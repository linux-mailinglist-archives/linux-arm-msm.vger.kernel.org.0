Return-Path: <linux-arm-msm+bounces-90618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIFGAiD7d2nlmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 00:39:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCDC8E3DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 00:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E1313008476
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 23:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37357312836;
	Mon, 26 Jan 2026 23:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQM47yFy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jC6Htphu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5999530FF2A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470719; cv=none; b=MSoJ35FGvkVVFWjxcJpPlAqCo2SzVjnZwhCT7KDEgFZK9LOzbaVIXPPAQ96bFcsHIDHG2+nAjVyF/+4MOcGKqYygFU/sclxENbb7Sd2qkGIrstpOh2gQ1aQ3aYDq0ql/gVaX0FCPvnXmr8/FhfXxJces4wUJUfctMbG2xnvqteY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470719; c=relaxed/simple;
	bh=xMUCXc+T1mxqitUAHJsbyD7zN0MBtP33MxPyki89jC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E+5FdSblweMyoNPGDbcFukG2hDuYLxKGvLbvIlSvRkk12u1phu9eZiA1BmNMMAl40aAwx0hC7GOROhgyBM5z9j1X9/qmpfGmIM8m58q//QRJXVKwmG/JSvvOQ/G2LscSjGqEDLSQa/WiPBiF3105VvQ08nzbs5TGtKCxlZL5zIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQM47yFy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jC6Htphu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgJgR2880232
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X71iaS2pCQJ
	5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=; b=LQM47yFyeyh8lDyXc7+YIA53FFW
	Y/WCEZJiHdNW8Unkb1fmCh5B9uXfUcqi/hm5kQrRf0mwACtfwGayJB+QxUaG0e+N
	GjpFbW3BAs2rlxSJAYjQy40++u4EDyQf/HaSQf/0vd1MB23UeGuWYmZjj6wlBt/3
	dRwtNAO2L+w+JVF3LhXcTLwvTpvs/6kbHGaESrhnb1gOyC0UCP9P43v1qFuKR0pF
	E9vnlvt1JJe/y4o84gC6Vh6Bsp3gQ+IKODr1R/pDWL8nmB8VpM8E+QV1xct187ox
	w10soBVm5Mmmh5n5VgwoVsiT5y5HAtLU/5Hz/HoLZ2MOdJ1Z0JuFR68RGNQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs0ct5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:35 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-123840bf029so37593556c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769470714; x=1770075514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X71iaS2pCQJ5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=;
        b=jC6HtphudHaGci2yxAPdgNRxZnuGACF4blVXNU+3xUEj/WnhbKU1VoP6qyHukVP2+i
         vYClwKtteSmrmtUdTOSFn0iciQ/uAkMsRs+Nq1QD9Uu90npWtbRp0Bum6UF5IvDPQEan
         /4D4h9UqUEvlbgRlxQSjR12YH0c6yCwa31bsVeqTdNbDMJQIT+vBQOWCNgCCh8m38DUC
         U1jLPu9M3fwChJOFw0V9pAQxe0peAqezZwfj18dloFgzZe2dxmHCC60lEtVbx8ZUn5yg
         RTwNGIGLNxPQTkl7CU0FIEcPs6V2Zt1CM7AUKFmyeDDtW2NJdJ2KAs5qouo4XK2nrgBQ
         0LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769470714; x=1770075514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X71iaS2pCQJ5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=;
        b=AKbtjVjvNsMfvYSVGbDrHRqiQSc6rmBcSbHUSIR6QrF6+wrHiqi1ry1ISS5q4ak9XS
         rkNwNM0r/I7sdCYCj9IEj5dNIwb9YOms33du9Dk3T7WJYQwHTL9y2pXdbqWQnGJ1TXim
         oBZgQAUJZAmfWtAhYOZrTR3zhjHO2GQgpwAJ2ViCUwX5sxMYreFn7PWrrrOg6HG2RU8l
         aFAhOTV3+SSAfcvMU6W+8AsGPmBAw49/IIaJUb4R5KJ1rmAJfNoewlRBHeQStAmc6QQL
         2qNh6GkjdxjR89znndmqcp/WMCT6YYcWJfnvLDSf1kMhgR0EGY/GuEO6dVm+FQ9nc8MG
         e1mA==
X-Gm-Message-State: AOJu0YzBjzbhTscd/5cvbIgAmkjVQjHzzbHxjdUfo8QFF2M67bVjQ0cx
	XmIsv43B7pye6UYIARIIdE7Gknh9lq2z6mjC8+SUJQQZnhLfH50j8oYdXaSUpY6mRpgYk162BgR
	r8xK9X1C0lRygJfou5kXB14DpFhIpRmw6g4GJC+y8Lp6knide94SsrE/C6PO5ueaaiLzgoSiBe7
	zq
X-Gm-Gg: AZuq6aKn5FYn3Y4KDi+aygk46uV1hMev+bsNWmitZhVavB3Jibilrm+fir1xS3+dn7R
	3MBPEwlP/Zp974AFsKOZMvoMabpq7p/lqOZBjDRBU6qgmAQZqLMwZpwXN/72GO7aljv5u05n3Lh
	i7nj0SmAxxHZj6w0fv0DbsBcBMw0zkzSgqGU55YrKFb9ephPXgleW6ANh9lluPzMM+vcgTjb6yT
	g7hRVv1+8Pb4HBwQserMdj/mVv050mWfmro/Gv42ykPjC5zTZpdVdULleWLnvGkzolIYV1thpJs
	KvwHyAJuQ+9dH86TMHcvrw4w2v+jf1vYTetkKxYA1XKitE2wpWZgvJBXguKe7kyHBnSC3Xvh/tf
	eAouW3lRiavuOkkavL9RP0Edu3/4gxg3mzxlUtwH3kpwuoxxeP6lUUfQs2pJOrbc=
X-Received: by 2002:a05:7022:699e:b0:11b:9386:a3cc with SMTP id a92af1059eb24-1248ec9c731mr3816968c88.45.1769470714198;
        Mon, 26 Jan 2026 15:38:34 -0800 (PST)
X-Received: by 2002:a05:7022:699e:b0:11b:9386:a3cc with SMTP id a92af1059eb24-1248ec9c731mr3816945c88.45.1769470713660;
        Mon, 26 Jan 2026 15:38:33 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm19948967c88.4.2026.01.26.15.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 15:38:33 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Mon, 26 Jan 2026 15:38:23 -0800
Message-Id: <20260126233830.2193816-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M1riNG6zD0CFM_KCjoZq7zc9eJhwSvsi
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=6977fafb cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=un400R04Xmhap_XYEvQA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: M1riNG6zD0CFM_KCjoZq7zc9eJhwSvsi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDIwMiBTYWx0ZWRfX4IP7fFpdZMfi
 OO46V6fOFXorXCQjw6gsPQ+kT7p0vJYc4x6af+MpBt9hM3WJajptGWubXBlBTjXV4uwlxR5KKFu
 /H7XFJoaaSniKiLLbzNiIIxpkv8610kC4pCzquOP9Zs8VX8iNAdSRixSQKNyZ/dQY0KbpkwGBZC
 +mV+QK7T1YjCpz/S6Tf9WEYJlT8vyu6RFI0Etses/rSCHQi/fOfmy888cBMvinQnNfA3ozW5l4S
 t+0YJ6dMXyqevalgXdauRRr3HB5e8c6KiGaiw2CjrTfVbv86Vey51rD57bSySh6I5h+PZ9KerTU
 /HOlBgLw+MWLzATSYYt37QtNy9zRj9NLeO40wE4CUV+Z87tSRhgRA87vwAARNuzXWc6ALoF73wo
 o7bdJiHPuOHO4s3QxRuR1oBwrgr9dRg7WXJx/Gb7ZLp+HcrinUmn1yE22m9ArhJzkwrlaumEjck
 +XXKGXsD5adLY+RAqjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90618-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BCDC8E3DE
X-Rspamd-Action: no action

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 16 ++++++++
 drivers/usb/misc/qcom_eud.c                | 43 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 2bab0db2d2f0..67223f73ee60 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -7,3 +7,19 @@ Description:
 		EUD based on a 1 or a 0 value. By enabling EUD,
 		the user is able to activate the mini-usb hub of
 		EUD for debug and trace capabilities.
+
+What:		/sys/bus/platform/drivers/qcom_eud/.../port
+Date:		January 2026
+Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
+Description:
+		Selects which USB port the Embedded USB Debugger (EUD)
+		is mapped to on platforms providing multiple High-Speed
+		USB ports.
+
+		Valid values:
+		  0 - Primary USB port
+		  1 - Secondary USB port
+
+		The attribute is writable only while EUD is disabled.
+		Reading the attribute returns the currently selected
+		USB port number.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 926419ca560f..1a136f8f1ae5 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,8 +23,11 @@
 #define EUD_REG_VBUS_INT_CLR	0x0080
 #define EUD_REG_CSR_EUD_EN	0x1014
 #define EUD_REG_SW_ATTACH_DET	0x1018
+#define EUD_REG_PORT_SEL	0x1028
 #define EUD_REG_EUD_EN2		0x0000
 
+#define EUD_MAX_PORTS		2
+
 #define EUD_ENABLE		BIT(0)
 #define EUD_INT_PET_EUD		BIT(0)
 #define EUD_INT_VBUS		BIT(2)
@@ -40,6 +43,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +108,47 @@ static ssize_t enable_store(struct device *dev,
 
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t port_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", chip->port_idx);
+}
+
+static ssize_t port_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+	u8 port;
+	int ret;
+
+	ret = kstrtou8(buf, 0, &port);
+	if (ret)
+		return ret;
+
+	/* Only port 0 and port 1 are valid */
+	if (port >= EUD_MAX_PORTS)
+		return -EINVAL;
+
+	/* Port selection must be done before enabling EUD */
+	if (chip->enabled) {
+		dev_err(chip->dev, "Cannot change port while EUD is enabled\n");
+		return -EBUSY;
+	}
+
+	writel(port, chip->base + EUD_REG_PORT_SEL);
+	chip->port_idx = port;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(port);
+
 static struct attribute *eud_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_port.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(eud);
-- 
2.34.1


